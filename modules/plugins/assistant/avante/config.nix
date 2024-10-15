{
  config,
  lib,
  ...
}: let
  inherit (lib.nvim.lua) toLuaObject;
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.nvim.dag) entryAnywhere;

  cfg = config.vim.assistant.copilot;
in {
  config = mkIf cfg.enable (mkMerge [
    {
      vim = {
        startPlugins = [
          "lua-utils-nvim"
          "nui-nvim"
          "nvim-nio"
          "pathlib-nvim"
          "plenary-nvim"
          "neorg"
          "neorg-telescope"
        ];
        pluginRC.avante = entryAnywhere ''
          require('avante').setup(${toLuaObject cfg.setupOpts})
        '';
      };
    }
  ]);
}
