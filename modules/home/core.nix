{ ... }:

{
  # Reusable Home Manager defaults shared by the user's machines.
  flake.homeModules.core = { ... }: {
    # Keep this at the release used when Home Manager was first installed.
    home.stateVersion = "26.05";

    programs.home-manager.enable = true;
  };
}
