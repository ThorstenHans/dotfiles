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
