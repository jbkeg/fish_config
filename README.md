# fish_config

Jons' personal fish configuration enhanced with [Fisher](https://github.com/jorgebucaran/fisher) and [Tide](https://github.com/IlanCosman/tide)

> Deprecated: this repository now forwards into [`dotfiles`](/Users/suptest/.dotfiles/dotfiles). Use the `fish-cli` profile there for ongoing setup and changes.

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

Run the compatibility wrapper to forward into the consolidated repo:

```fish
./install.fish
```

Equivalent command in the consolidated repo:

```sh
../dotfiles/bootstrap/install --profile fish-cli --links
```

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
./uninstall.fish
```
