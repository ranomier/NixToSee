# My understanding of nix terms

## The nix trinity

### nix

Is "just" a package manager + programming language attached to it. It is not necessarily connected to *nixpkgs* or *NixOS*. You could just create your own package repository and or distro. The package manager can also run standalone on basically any distro without needing something like NixOS.

### nixpkgs

A git repository with loads of recipes of packages and tools to build them more easily.

- The `lib` that you "import" like this `{lib, ...}: {}` is coming from here.
- it also technically contains *NixOS* though it is mostly separate, there are some shared parts, but no dependencies as far as i know

### NixOS

A distro build upon nix and nixpkgs. It lives in the same repo as *nixpkgs*

- Houses tools like `nixos-rebuild`
- And `switch-to-configuration` framework

## Other big concepts

### flakes

The term is not just used for the new file layout, but also the *new cli* around it. *Flakes* try to go after more "purity". For example with flakes the `inputs` (read where to download sources) and replaces channels by it.

- One of the Benefit is that you get a `flake.lock` file in which the sources are locked via various ways (git commit, hash, etc).
  Beforehand channels where handled system wide and so developers had different versions again ...
- My suggestion use flakes and therefor avoid `fetch` commands and registry syntax with `<nixpkgs>` (a registry is basically just a naming system (dns) and i **think** `<nixpkgs>` would just point to your local channel and the end of the chain)

### new cli

As mentioned before with the flakes there also comes a new cli, mostly seperate tools new are part of nix

| Old            | New             |
| -------------- | --------------- |
| nix-shell      | nix shell       |
| nix-store      | nix store       |
| ...            | ...             |

- [nix manual on new cli](https://nix.dev/manual/nix/2.28/command-ref/new-cli/nix)
- [nix wiki on new cli](https://wiki.nixos.org/wiki/Nix_(command))

