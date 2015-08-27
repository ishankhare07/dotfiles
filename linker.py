import os
import sys

class Linker:
    def __init__(self):
        self.dirs = os.listdir()
        self.home = os.path.expanduser("~")
        self.force = False
        self.theme = False

        for args in sys.argv:
            if args[0] == "-":                                 # options provided
                for option in args[1:]:
                    if option == "f":
                        self.force = True
                    elif option == "t":
                        self.theme = True
                    else:
                        print("Usage: python3 linker.py [-ft]")

    def link(self):
        for enitity in self.dirs:
            if not enitity[0] == '.':
                pass
            elif enitity == '.git':
                pass
            else:
                self.create_symlink(enitity)

    def create_symlink(self, enitity):
        try:
            os.symlink(self.home + "/dotfiles/" + enitity, self.home + "/" + enitity)
            print("created symlink", enitity)
        except FileExistsError as fileExists:
            if self.force:
                os.remove(self.home + "/" + enitity)        # remove that file
                self.create_symlink(enitity)                # retry symlinking for the entity
            else:
                print("Symlink exists", enitity)                # symlink already exists

    def link_theme(self):
        themes_dir = self.home + "/.oh-my-zsh/custom/themes"
        if not os.path.exists(themes_dir):
            os.mkdir(themes_dir)
        try:
            os.symlink(self.home + "/dotfiles/ishankhare07.zsh-theme", themes_dir + "/robbyrussell.zsh-theme")
            print("Successfully linked theme file")
        except FileExistsError as fileExists:
            if self.force:
                os.remove(themes_dir + "/robbyrussell.zsh-theme")   # remove existing symlink
                self.link_theme()                                   # retry symlinking
                return
            print("Theme already linked")

if __name__ == "__main__":
    l = Linker()
    l.link()
    if l.theme:
        l.link_theme()

