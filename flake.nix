{
  description = "my-flakes-frse";

  # パッケージ設定
  inputs = {
    # WSL Nix
    nixos-wsl.url = "github:nix-community/NixOS-WSL/release-25.05";
    
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # HomeManager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, flake-utils, ... }@inputs: {
    # The host with the hostname `nixos` will use this configuration
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # 初期confを読み取る
        ./configuration.nix
        
        # Input設定
        ./module/jpinput/jpinput_configuration.nix

        # Display設定
        ./module/display/display_configuration.nix

        # Disk
        ./module/disk/disk_configuration.nix

        # Docker設定
        ./module/docker/docker_configuration.nix

        # Editor設定
        ./module/editor/editor_configuration.nix
        
        # wsl設定
        nixos-wsl.nixosModules.default
          {
            system.stateVersion = "25.05";
            wsl.enable = true;
          }

        # home-managerの有効化
        home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.frse = import ./home.nix;
          }

      ];
    };
    # NixShellの設定
    devShells = flake-utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # GCC環境のNixShell
        gcclatest = import ./nix-shell/builders/gcc.shell.nix { inherit pkgs; };
      }
    );
  };
}

