# dotfiles
dotfiles for vim and neovim configuration

*Following are some custom `git` specific aliases that I have added  
apart from the ones provided by [oh-my-zsh git plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)*

1. git specific  
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
  
  
