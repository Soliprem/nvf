{
  config,
  lib,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.nvim.types) mkPluginSetupOption;
in {
  options.vim.mini.test = {
    enable = mkEnableOption "mini.test";
    setupOpts = mkPluginSetupOption "mini.test" {};
  };
}
