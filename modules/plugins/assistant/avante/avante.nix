{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkRenamedOptionModule;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) nullOr str enum float;
  inherit (lib.nvim.types) mkPluginSetupOption;

  cfg = config.vim.assistant.copilot;
in {
  options.vim.assistant.avante = {
    enable = mkEnableOption "avante";
    setupOpts = mkPluginSetupOption "avante" {};
  };
}
