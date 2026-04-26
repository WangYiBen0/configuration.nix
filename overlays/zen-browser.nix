inputs: _final: prev: {
  zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
}
