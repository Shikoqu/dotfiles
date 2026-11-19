{ inputs, ... }:

{
  flake.homeModules.packages = { pkgs, ... }: {
    home.packages = [
      pkgs.git
      pkgs.stow
      pkgs.htop
      pkgs.fastfetch
      pkgs.vulkan-tools
      inputs.herdr-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.codex-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
