# Linux kernel module written in Zig

This is a proof-of-concept on how to integrate [zig](https://ziglang.org/) into
Linux kernel modules.

## USAGE

This assumes that you kernel headers installed.
In Debian based systems can be done using `apt-get install linux-headers-$(uname -r)`.

```console
$ make
$ sudo insmod ./zig.ko
$ sudo rmmod zig
$ dmesg | grep 'kernel!'
[41188.642871] Hello kernel!
[41190.975214] Goodbye kernel!
```

If your Linux distribution does not install kernel headers to
`/lib/modules/*/build`, you can also set the `KERNELDIR` environment variable:

```console
make KERNELDIR=/path/to/headers/build
```

On NixOS spawn a nix-shell from the project root:

```console
nix-shell --command "make"
```

You might need to replace the Linux package in `default.nix` with the package matching your
loaded kernel.
