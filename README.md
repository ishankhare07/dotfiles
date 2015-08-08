# dotfiles

1. git specific  
  *Following are some custom `git` specific aliases that I have added  
apart from the ones provided by [oh-my-zsh git plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)*  

  * list all remote branches i.e. on github  
  ```bash
  alias glrh="git ls-remote --heads"
  ```
  * checkout a new remote branch from github and set tracking info  
  ```bash
  alias gctb="git checkout --track -b"      # followed by <local_branch_name> <origin/remote_branch_name>
  ```
  * set tracking info while pushing a new branch to github
  ```bash
  alias gpsup="git push --set-upstream"      # useful for first time push of new branches
  ```
  * list out tracking info of each local branch
  ```bash
  alias gbvv="git branch -vv" 
  ```  
2. Python symlink linker  
  The file [linker.py](https://github.com/ishankhare07/dotfiles/blob/master/linker.py) is an automated script that generates symbolic links to this `dotfiles` folder, assuming that it is located in your `home directory`. It skips already existing symlinks(prints a message as well) and creates those which do not(another message for this). It symlinks you files and folders both, i.e. we will have links for `dotfiles/.vim` as well as `dotfiles/.vimrc`. Anyone can use this file as it configures your `~` directory automatically, so you don't need to worry about your username conflicts, although the script assumes that dotfiles are in a folder named `.dotfiles` inside you `~` directory, i.e. `~/.dotfiles` and NOT `~/dotfiles`. I may add a commandline parameter to provide your custom folder name in the future.
