# Dotfiles

```
    __         __    ___ __ __               TM        ╱|、_
.--|  |.-----.|  |_.'  _|__|  |.-----.-----.          (` - /
|  _  ||  _  ||   _|   _|  |  ||  -__|__ --|          |、⁻ 〵   ,
|_____||_____||____|__| |__|__||_____|_____|          じし _,)ノ
```

A place where most developers spend too much time to save a few minutes in the future...

## Home Manager

The repository root is a standalone Home Manager flake. Its Nix configuration
uses the Dendritic pattern with flake-parts and import-tree: every Nix file in
`modules/` is a flake-parts module, and the host module combines reusable Home
Manager features into a machine configuration.

Current layout:

```text
flake.nix
modules/
  home/       # reusable Home Manager features
  hosts/      # machine-specific composition
```

The `thinkpad` host currently targets `x86_64-linux`. Nix manages packages and
Fish; app configuration remains in the existing Stow packages under
`packages/`.

Home Manager's default config directory (`~/.config/home-manager`) points to
this repository, so from any directory you can build and activate it with:

```sh
home-manager switch
```

The `home.stateVersion` in `modules/home/core.nix` records the Home Manager
compatibility baseline; keep it at its original value when updating Nix inputs.

Zed is installed from Flathub as a user Flatpak managed by Home Manager through
`nix-flatpak`. Its software-rendering override allows it to start on the
ThinkPad; Zed currently uses llvmpipe because the Intel HD 3000 does not
provide a Vulkan adapter accepted by Zed. Zed preferences remain in the normal
user data directory.

## Stow

Stow continues to manage app configuration from `packages/`. For example:

```sh
./scripts/stow-packages git bat kitty
```

Package installation belongs in the Home Manager feature modules under
`modules/home/`; app configuration belongs in a
Stow package when keeping it as a regular editable file is useful. This split
can be revisited as the setup grows to other machines and operating systems.

## Tools

TOOLS:
- [Nix](https://nixos.org/) - package manager and Home Manager configuration
- [dinky bu mikker](https://github.com/mikker/Dinky) - tiling window manager ([earospace](https://github.com/nikitabobko/AeroSpace) but using MacOS spaces)
- [ghostty](https://ghostty.org/) / [kitty](https://sw.kovidgoyal.net/kitty/) - terminal
- xdg-ninja - but dont force it (if app complies thats great if not then fuck it...)
