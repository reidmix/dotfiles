brewdirs=( Library share )

for brewdir in $brewdirs; do
	dir="/usr/local/$brewdir" 
  if ! [ -w $dir ]; then 
		echo "Setting group writeable permssion for $dir"
		chmod -R 775 $dir
	fi
done

# Check for Homebrew, install if we don't have it
if [ ! $(which brew) ]; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check installation && update homebrew recipes
brew doctor
brew update
