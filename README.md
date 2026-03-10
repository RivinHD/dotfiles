# Installation

Install `chezmoi` using the package manager of the system.
The initialize and apply the dotfiles using:
```sh
chezmoi init --apply git@github.com:RivinHD/dotfiles.git
```

OR use a local installation with:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply git@github.com:RivinHD/dotfiles.git
```


## Installation Types

- **private:** Install everything including encrypted stuff.
- **public:** Install interactively all non-encrypted stuff. 
