require('bepo')  -- must be before lazy, as lazy loads langmapper which needs the bépo mapping to be set
require("config.lazy")

if vim.g.vscode then
    -- Color changer for the vscode neovim ui extension
    require("vscode-ui")
end