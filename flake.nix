# flake.nix

{

  description = "SageMath development environment on Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let

      #################
      ### VARIABLES ###
      #################

      ### You can modify this:

      welcome = "Welcome to the SageMath Nix development environment!";
      mambaRootDir = "$HOME/.mamba";
      envName = "sage-dev";
      envFile = builtins.toString ./. + "/environment-3.12-linux.yml";

      ###################
      ### FLAKE STUFF ###
      ###################

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      #######################
      ### FHS ENVIRONMENT ###
      #######################

      fhs = pkgs.buildFHSEnv {

        name = "${envName}";

        targetPkgs = pkgs: [pkgs.micromamba] ;

        profile = ''
          set -e
          eval "$(micromamba shell hook --shell=posix)"
          export MAMBA_ROOT_PREFIX=${mambaRootDir}
          if ! test -d $MAMBA_ROOT_PREFIX/envs/${envName}; then
              micromamba env create --file ${envFile} --name ${envName}
          fi
          micromamba activate ${envName}
          echo "${welcome}"
          set +e
        '';

      };
    in
      {
        devShells.${system}.default = fhs.env;
      };

}
