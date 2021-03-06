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
                        exit()

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
            print('\u002B', "created symlink", enitity)
        except FileExistsError as fileExists:
            if self.force:
                os.remove(self.home + "/" + enitity)        # remove that file
                self.create_symlink(enitity)                # retry symlinking for the entity
            else:
                print('\U00002713', "Symlink exists", enitity)                # symlink already exists

    def link_theme(self):
        themes_dir = self.home + "/.oh-my-zsh/custom/themes"
        if not os.path.exists(themes_dir):
            os.mkdir(themes_dir)
        try:
            for themefile in filter(lambda x: x if x.endswith('.zsh-theme') else None, os.listdir()):
                os.symlink(self.home + "/dotfiles/" + themefile, themes_dir + "/" + themefile)
            print('\u002b', "Successfully linked theme files")
        except FileExistsError as fileExists:
            if self.force:
                for themefile in filter(lambda x: x if x.endswith('.zsh-theme') else None, os.listdir()):
                    os.remove(themes_dir + "/" + themefile)         # remove existing symlink
                self.link_theme()                                   # retry symlinking
                return
            print('\U0001f5f8', "Theme already linked")

if __name__ == "__main__":
    l = Linker()
    l.link()
    if l.theme:
        l.link_theme()

