# Development environment for SageMath on NixOS

This is a Nix minimalist development environment made to build SageMath
locally. This script was made during the [Sage Days
130.5](https://wiki.sagemath.org/days130.5) workshop in Montréal.

**I don't know what I'm doing!!!**

Howto:
- Clone the SageMath repository.
- Copy the `shell.nix` file in it.
- Run `nix-shell`. This will download dependencies. Exit the virtual env. with
  `exit`, and re-enter it with `nix-shell`. Note that once the environment has
  been downloaded for the first time, you will not need to exit and re-enter.
- You can now build Sage according to the Sage documentation (see thereafter).

Sources:
- The [official NixOS
  wiki](https://wiki.nixos.org/wiki/Python#Using_micromamba). Note that this is
  not the [recommended
  way](https://wiki.nixos.org/wiki/Python#Using_buildFHSEnv_(Recommended)),
  according to the same page.

- The Sage documentation, to [build Sage using
  conda](https://doc.sagemath.org/html/en/installation/source.html#using-conda).

- [This tutorial](https://www.jaakkoluttinen.fi/blog/conda-on-nixos/), that I
  don't really understand, but both seems cool and overkill.
