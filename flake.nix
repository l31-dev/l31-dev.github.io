{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell { 
        packages = with pkgs; [ nodePackages_latest.pnpm nodejs ]; 
        shellHook = ''
          echo
          echo "Pnpm : $(pnpm -v)"
          echo "Node : $(node -v)"
        '';
      };
    };
}
