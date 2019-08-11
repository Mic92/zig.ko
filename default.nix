with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = linux.moduleBuildDependencies ++ [ zig ];
  shellHook = ''
    export KERNELDIR=$(echo ${linux.dev}/lib/modules/*/build)
  '';
  hardeningDisable=["all"];
}
