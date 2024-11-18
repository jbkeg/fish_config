# fish_config

Jons' personal fish configuration enhanced with [Fisher](https://github.com/jorgebucaran/fisher) and [Tide](https://github.com/IlanCosman/tide)

## Table of contents

- [fish_config](#fish_config)
  - [Table of contents](#table-of-contents)
  - [Installation](#installation)
    - [Pre-Install](#pre-install)
    - [Install](#install)
    - [Post-Install](#post-install)
    - [Uninstallation](#uninstallation)

## Installation

### Pre-Install

- Requirement:
  - fish shell
  - git
  - kitty

### Install

Run installation script

```fish
./install.fish
```

> Above command will install `fisher` with `other plugins` and `tide`. and symlink `fish config` and `kitty config` under `$XDG_CONFIG_HOME` or `$HOME/.config` as default.

### Post-Install

- Install or delete plugins from `fisher`. Customize `functions` and `completions`

- Change fish themes by running below command

  ```fish
  fisher list # To check which themes are been installed through fisher
  fish_config theme # To check which themes are available at the moment
  fish_config theme safe {{Name of the theme}} # Select and save theme you choose
  fish_config # To run fish configuration GUI
  ```

- Change kitty terminal themes by running below command

  ```fish
  	kitty +kitten theme
  ```

### Uninstallation

```fish
./uninstall.sh
rm -rf /path/to/fish_config/repo
```
