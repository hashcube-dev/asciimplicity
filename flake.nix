{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };
  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs { system = "${system}"; };
        in
        {
          default = pkgs.mkShellNoCC { packages = with pkgs; [
            nushell
            typst
            typstPackages.catppuccin
          ]; };
        }
      );
    };
}
