#!/usr/bin/env bash

[[ -z $1 ]] && printf 'Please provide the nixosConfigurations name to be build\n' && exit 1

printf '>>> building vm: %s\n' "$1"
nix build ".#nixosConfigurations.$1.config.system.build.vm"

export QEMU_NET_OPTS="\
hostfwd=tcp::2222-:22,\
hostfwd=tcp::2280-:80,\
hostfwd=tcp::29200-:9200,\
hostfwd=tcp::2443-:443,\
hostfwd=tcp::9200-:443\
"

export QEMU_KERNEL_PARAMS="\
console=ttyS0\
"

printf -- '%s' "$QEMU_NET_OPTS"
printf -- "</\n"

printf -- '%s' "$QEMU_KERNEL_PARAMS"
printf -- "</\n"

printf -- '>>> pwd: %s\n' "$(pwd)"


"./result/bin/run-$1-vm" -nographic
