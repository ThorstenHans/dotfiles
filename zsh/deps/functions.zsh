function myip()
{
	ip=$(curl -s https://myip.fermyon.app/)
	echo $ip
}

function guid()
{
	local count=${1:-1}
	id=$(curl -s https://uuid.fermyon.app/$count)
	echo $id
}

function get_lke_kubeconfig() {
  local cluster_name="${1:?Error: Please provide a cluster name}"

  print -P "\n%F{cyan}[~] Looking for LKE cluster '%B${cluster_name}%b'...%f"

  local cluster_ids=("${(@f)$(linode lke clusters-list --label "$cluster_name" --json | jq -r '.[].id')}")

  if [[ -z "${cluster_ids[1]}" ]]; then
    print -P "%F{red}[✘] No cluster found with label '${cluster_name}'.%f\n"
    return 1
  fi

  if [[ ${#cluster_ids[@]} -gt 1 ]]; then
    print -P "%F{yellow}[!] Multiple clusters found matching '${cluster_name}':%f"
    local cluster_names=("${(@f)$(linode lke clusters-list --label "$cluster_name" --json | jq -r '.[].label')}")
    for name in $cluster_names; do
      print -P "  %F{yellow}• ${name}%f"
    done
    print -P "%F{yellow}Please use a more specific name.%f\n"
    return 1
  fi

  local cluster_id="${cluster_ids[1]}"
  print -P "%F{green}[✔] Cluster found (ID: ${cluster_id}).%f"

  print -P "%F{cyan}[~] Appending kubeconfig...%f"

  if linode lke kubeconfig-view "$cluster_id" --json | jq -r '.[].kubeconfig | @base64d' >> ~/.kube/config; then
    print -P "%F{green}[✔] Kubeconfig updated successfully.%f\n"
  else
    print -P "%F{red}[✘] Failed to retrieve or append kubeconfig.%f\n"
    return 1
  fi

  kubectl config get-contexts
}

function find_app_by_id() {
  local target_id="${1:?Error: Please provide a Target App ID (GUID)}"
  
  print "🔍 Searching through accounts..."

  # Safely get account IDs into a Zsh array
  # This splits the output of the command into lines
  local accounts=("${(@f)$(spin aka info --format json | jq -r '.auth_info.accounts[].id')}")

  for acc_id in $accounts; do
    # Skip empty strings if any
    [[ -z "$acc_id" ]] && continue

    # Check the account for the specific App ID
    if spin aka apps list --account-id "$acc_id" --format json 2>/dev/null | jq -e ".[] | select(.id == \"$target_id\")" > /dev/null; then
      print -P "\n%F{green}[✔] Match Found!%f"
      print "Account ID: $acc_id"
      spin aka app status --account-id $acc_id --app-id $target_id
      return 0
    fi
  done

  print -P "\n%F{red}[✘] App ID not found in any accessible accounts.%f"
  return 1
}
