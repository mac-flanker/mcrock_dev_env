{
  description = "Dev Environment";

  # Flake inputs
  # inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # Stable Nixpkgs (use 0.1 for unstable)

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs
  outputs =
    { 
      self,
      nixpkgs,
      home-manager, 
      ... 
    }@inputs:
    let
      inherit (self) outputs;
      theme = "kanagawa";
      font-family = "Hack Nerd Font Mono";

      system_linux = "x86_64-linux";
      # The systems supported for this flake's outputs
      # supportedSystems = [
      #   "x86_64-linux" # 64-bit Intel/AMD Linux
      #   "aarch64-linux" # 64-bit ARM Linux
      #   "aarch64-darwin" # 64-bit ARM macOS
      # ];
    in
    {
      
      homeConfigurations = {
        # UbuntuMachine
        "mike-MS-7A59" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system_linux};
          extraSpecialArgs = {
            inherit
              inputs
              outputs
              theme
              font-family
              ;
          };
          # > Our main home-manager configuration file < 
          modules = [
            {
              imports = [
                ./my_system.nix
                ./home-manager/common.nix
              ];
              config = {
                mySystem = {
                  username = "mike";
                  fullname = "Mike Crocker";
                  email = "mikaelcrocker@gmail.com";
                  homeDirectory = "/home/mike";
                };
              };
            }
          ];
        };
      };
    };  
}
