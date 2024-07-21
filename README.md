# PinePhone configuration

Install `git` and run:

```bash
cd ~
glt clone https://luis-licea/pinephone-dotfiles.git
git config --local status.showUntrackedFiles no
.local/bin/scripts/install-nix.sh
git checkout # pass --force to restore all files
home-manager switch
```
