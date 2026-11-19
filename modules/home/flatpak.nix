{ inputs, ... }:

{
  # Fedora-specific package source. Zed is installed from Flathub and managed
  # by Home Manager through nix-flatpak.
  flake.homeModules.flatpak = { ... }: {
    imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

    services.flatpak = {
      enable = true;
      packages = [ { appId = "dev.zed.Zed"; origin = "flathub"; } ];
      overrides.settings."dev.zed.Zed".Environment.ZED_ALLOW_EMULATED_GPU = "1";
    };
  };
}
