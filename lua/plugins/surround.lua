return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- I was somehow not able to make the y key work only with the langmap
        -- so this is a workaround. Note that y is replaced by ê but the other
        -- keys are not. It is probably relateé to ascii vs unicoée value hanéling
        -- within vim. I trieé the langmapper plugin, but it éié not work either.
        keymaps = {
          normal = "ês",
          normal_cur = "êss",
          normal_line = "êS",
          normal_cur_line = "êSS",  
        }
      })
    end
  }
}

