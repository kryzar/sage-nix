# Development environment for SageMath on NixOS

This is a Nix minimalist development environment made to build SageMath
locally. We provide both a `shell.nix` file (enter the env. with `nix-shell`)
and a flake (enter the env. with `nix develop`) to enter a `micromamba`
development environment.

These scripts were created during the [Sage Days
130.5](https://wiki.sagemath.org/days130.5) workshop in Montréal.

## Build SageMath

### Enter the development environment

The first step is to enter a Sage `micromamba` development environment with
your shell. There are two distinct ways to achieve this: using a traditional
`shell.nix` file, or a flake. In both cases, we set-up a development
environment using `micromamba`, that will the be used to install Sage
dependencies in `$HOME/.mamba` (this location can be changed by setting the
parameter `mambaRoot`, in either `shell.nix` or `flake.nix`).

#### With the traditional `shell.nix` file

1. Make sure the `shell.nix` is in the Sage repository.
2. Run `nix-shell`.
3. You are now in the development environment!

*Sources:*
- [The official NixOS
  wiki](https://wiki.nixos.org/wiki/Python#Using_micromamba). Note that this is
  not the [recommended
  way](https://wiki.nixos.org/wiki/Python#Using_buildFHSEnv_(Recommended)),
  according to the same page.
- [This tutorial, that I don't really understand, but both seems cool and
  overkill](https://www.jaakkoluttinen.fi/blog/conda-on-nixos/).

#### With a flake

Flakes are an experimental feature of Nix; among other things, flakes allow to
pin versions of `nixpkgs`. They must be explicitly activated. We assume this
has been done.

1. Make sure the `flake.nix` is in the Sage repository.
2. Run `nix flake update` to create the `flake.lock` file, if it has not been
   created already, or if you want to update `nixpkgs`.
3. Run `nix develop`.
4. You are now in the development environment!

*Sources:*

- [A short tutorial, that uses `pkgs.buildFHSUserEnv`, that has since been
  replaced by
  `pkgs.buildFHSEnv`](https://www.alexghr.me/blog/til-nix-flake-fhs/).
- [Documentation for the `pkgs.buildFHSEnv` Nix
  function](https://git.qyliss.net/nixlib/tree/nixpkgs/doc/build-helpers/special/fhs-environments.section.md).
- [Less up-to-date documentation for the `pkgs.buildFHSEnv` Nix
  function](https://ryantm.github.io/nixpkgs/builders/special/fhs-environments/#sec-fhs-environments).
- [A random discourse
  post](https://discourse.nixos.org/t/flakes-way-of-creating-a-fhs-environment/20821/5).

#### Caveat

> [!CAUTION]
> Once the environment has been entered for the first time, `micromamba` will
> likely prompt you to run `micromamba activate sage-dev`. I would advice
> exiting the shell and re-entering with either `nix-shell` or `nix develop`,
> depending on your preferred method.

### Build Sage

Once in the `micromamba` development environment and all dependencies have been
installed, you can simply build Sage with:

1. `pip install --no-build-isolation --editable .`

*Sources:*
- [The Sage documentation for building Sage using
  conda](https://doc.sagemath.org/html/en/installation/source.html#using-conda).

## Disclaimer

**I don't know what I'm doing!!!**
