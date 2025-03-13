<div align=center>

![ICON](https://nixos.wiki/images/thumb/2/20/Home-nixos-logo.png/207px-Home-nixos-logo.png)

<br>

[![Nix](https://img.shields.io/badge/NixOs-24.11-809fdf.svg?logo=NixOS&logoColor=809fdf&style=flat-square)](https://nixos.org/) [![Nix](https://img.shields.io/badge/Nix_Flakes-Check-809fdf.svg?logo=NixOS&logoColor=809fdf&style=flat-square)](https://nixos.org/) [![Hyprland Badge](https://img.shields.io/badge/Hyprland-stable-809fdf?logo=hyprland&logoColor=809fdf&style=flat-square)](https://hyprland.org/)

[![LatestCommits](https://img.shields.io/github/last-commit/SirQuacksALot/nix.dotfiles?color=809fdf&logo=github&logoColor=809fdf&style=flat-square)](https://github.com/SirQuacksALot/nix.dotfiles/activity) [![RepoSize](https://img.shields.io/github/repo-size/SirQuacksALot/nix.dotfiles?color=809fdf&logo=github&logoColor=809fdf&style=flat-square)](https://github.com/SirQuacksALot/nix.dotfiles)


<br>

# SirQuacksALot NixOs System Config
orderly all around nixos configuration

<br>

![where is the screenshot 🤔](current_state_screenshot.png)

<br>

</div>

This is my approche to NixOs. This repo holds the the nixos config for my personal machine, used for work. This repo additionaly will be used as the documentation of said configurations. This project is inspired by [HeinzDev NixOS Dotfiles](https://github.com/HeinzDev/Hyprland-dotfiles/tree/main) and [JaKootLit's NixOS Hyprland](https://github.com/JaKooLit/NixOS-Hyprland/tree/main?tab=readme-ov-file).

> [!IMPORTANT]
>As this is a personal project I will not accept any push requests. You may use this repo as reference for your own projects but there will be no contributers other then me, the author.

## Getting started 🚀

clone the repoisitory via

```bash
git clone https://github.com/SirQuacksALot/nix.system.git
```

build your system with the flake of the repo (the host name can be set inside the flake)

```bash
nixos-rebuild switch --use-remote-sudo --flake .#xps13 
```

## System info 💻

![vendor](https://img.shields.io/badge/MODEL-dell_xps13_9315-gray?logo=dell&logoColor=fff&labelColor=0071C5&style=flat-square)  
![cpu](https://img.shields.io/badge/CPU-12th_Gen_Intel_i5--1230U_(12)_@_4._00GHz-gray?logo=intel&logoColor=fff&labelColor=0071C5&style=flat-square)  
![gpu](https://img.shields.io/badge/GPU-Intel_Alder_Lake--UP4_GT2_[Iris_Xe_Graphics]-gray?logo=intel&logoColor=fff&labelColor=0071C5&style=flat-square)  
![ram](https://img.shields.io/badge/RAM-7569Mi_(8_GiB)-gray?logo=intel&logoColor=fff&labelColor=0071C5&style=flat-square)  

## Documentation 🪴

There is nothing here ? Yet ... 😺

<!---
## Directory Structure 📁

```none
├──home
│  ├──dot.configs
│  └──wallpapers
├──hosts
│  └──xps13-9315
│     ├──fonts
│     ├──modules
│     ├──programs
│     │   └──hypr
│     ├──scripts
│     ├──services
│     └──virtualisation
├──nixos
├──flake.nix
├──flake.lock
└──README.md
```
-->

<div align=center>

##

![IMAGE](https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true)

Author [@SirQuacksALot](https://github.com/SirQuacksALot) at 2025-present

[![LICENSE](https://img.shields.io/github/license/SirQuacksALot/nix.dotfiles?style=flat-square&logo=github)](https://github.com/SirQuacksALot/nix.dotfiles?tab=MIT-1-ov-file)
