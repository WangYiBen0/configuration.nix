_inputs: [
  # `foo.nix` is an overlay function wrapped with `inputs:` function
  # e.g. inputs: final: prev: { bar = inputs.foo.packages.${prev.stdenv.hostPlatform.system}.default; }

  # (import ./foo.nix inputs)
]
