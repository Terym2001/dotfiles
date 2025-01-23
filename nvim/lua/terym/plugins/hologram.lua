return {
  "edluffy/hologram.nvim",
  config = function()
    local hologram = require("hologram")

    hologram.setup{
      auto_display = true
    }
  end
}
