#check brew
if [ `command -v which brew` ]
then
	echo "brew not found, installing....."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ishankhare/.zshrc
	eval "$(/opt/homebrew/bin/brew shellenv)"
	echo "successfully installed brew!"
fi
