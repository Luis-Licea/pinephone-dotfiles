# PinePhone configuration

Install `git` and run:

```bash
cd ~
glt clone https://luis-licea/pinephone-dotfiles.git
git config --local status.showUntrackedFiles no
.local/bin/scripts/install-nix.sh
git checkout
home-manager switch
```
