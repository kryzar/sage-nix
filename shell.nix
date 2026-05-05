{ pkgs ? import <nixpkgs> {}}:

let

  ###########################
  ### YOU CAN MODIFY THIS ###
  ###########################

  welcome = "Welcome to the SageMath Nix development environment!";
  mambaRootDir = "${builtins.getEnv "HOME"}/.mamba";
  envName = "sage-dev";
  envFile = "environment-3.12-linux.yml";

  ##################################
  ### YOU SHOULD NOT MODIFY THIS ###
  ##################################

  fhs = pkgs.buildFHSEnv {

    name = envName;

    targetPkgs = _: [
      pkgs.micromamba
    ];

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
in fhs.env
