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
