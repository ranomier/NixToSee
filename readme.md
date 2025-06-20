# [NixToSee](https://git.katzies.win/Ranomier/NixToSee)

*nichts* in german means nothing, if you say it fast it sounds like nix.

## folder structure

### system_profiles

This whole folder is for the most part just a system to clean up importing

- Files in the [system_profiles](system_profiles) directory:
  - Should never import anything from parent directories
  - Can import things from the child directories
  - The [importers](system_profiles/importers) directory:
    - Should only import things outside (above/parent) of the [system_profiles](system_profiles) directories.
    - Probably only from the module directory or maybe a future nix-modules directory,
      this rule is not set in stone yet
    - Should **not** import anything outside of this repository
  - The [components](system_profiles/components) directory:
    - Should never import anything from this repository
    - It can import things from nixpkgs
    - Should set only basic "system" settings
      ("system" is not well defined)
