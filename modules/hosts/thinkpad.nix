{ inputs, ... }:

let
  system = "x86_64-linux";
in
{
  flake.homeConfigurations.jotta = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.${system};

    modules = [
      inputs.self.homeModules.core
      inputs.self.homeModules.packages
      inputs.self.homeModules.fish
      inputs.self.homeModules.flatpak
      {
        home.username = "jotta";
        home.homeDirectory = "/home/jotta";
      }
    ];

    extraSpecialArgs = { inherit inputs; };
  };
}
