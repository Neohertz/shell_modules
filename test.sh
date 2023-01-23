Type=$1
NL=$'\n'
RED='\033[0;33m'
NC='\033[0m'

if [[ $# -eq 0 ]] ; then
	echo 'Invalid command. Please specifiy a type.'
	echo 'Usage: new <rojo>'
	exit 1
fi

if [[ $Type == 'rojo' ]] ; then
	read -p 'Project Name: ' ProjectName

	# Check to see if the input is empty.
	[[ -z "$ProjectName" ]] && echo 'Error: Please specify a project name.' && exit 1

	# Check for spaces.
	[[ $ProjectName = *" "* ]] && echo 'Error: Project name cannot contain spaces.' && exit 1

	read -p 'Location: ' Location

	# Ensure that location is a directory
	
	[[ ! -d $Location ]] && echo 'Error: Location is not a directory.' && exit 1 

	read -p "$(echo "${RED}Create new project? (y/n) ${NC}")" Confirm	

	# Ensure the result is y
	[[ ! $Confirm == 'y' ]] && echo 'Aborted' && exit 1 

	# Create new Project
	New="$Location/$ProjectName"
	echo $New
	mkdir -p "$New" && cd "$New"
	pwd

else
	echo '[New] Usage: new <rojo>'
fi


