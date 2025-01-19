local tmux = require("tmux")

tmux.setup {
  copy_sync = { enable = false },
  navigation = {
    cycle_navigation = false,
    enable_default_keybindings = false,
    persist_zoom = true,
  },
  resize = {
    enable_default_keybindings = false
  }
}
