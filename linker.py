import os


class Linker:
    def __init__(self):
        self.dirs = os.listdir()
        self.home = os.path.expanduser("~")

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
            os.symlink(self.home + "/.dotfiles/" + enitity, self.home + "/" + enitity)
        except FileExistsError as fileExists:
            print("Symlink exists", enitity)       # symlink already exists

if __name__ == "__main__":
    Linker().link()
