{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
    iosevka-hashcube.url = "git+https://tangled.org/did:plc:efquyxtdunysezeo27wkrw5l";
  };
  outputs =
    {
      self,
      nixpkgs,
      systems,
      iosevka-hashcube,
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
            iosevka-hashcube.packages.${system}.default
          ]; };
        }
      );
    };
}
