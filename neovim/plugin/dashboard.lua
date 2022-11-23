local db = require('dashboard')
local home = os.getenv('HOME')
db.default_executive = 'telescope'
db.custom_center = {
  { icon = '  ', desc = 'Find File       ', action = 'Telescope find_files', shortcut = 'SPC f f'},
  { icon = '  ', desc = 'Edit Dotfiles   ', action = 'Telescope dotfiles path=' .. home .. '/dotfiles',    shortcut = 'SPC f d'},

}

db.custom_header = {
[[ ______  __  __   __   __   ______   ]], 
[[/\__  _\/\ \_\ \ /\ "-.\ \ /\  ___\   ]],
[[\/_/\ \/\ \  __ \\ \ \-.  \\ \___  \  ]],
[[   \ \_\ \ \_\ \_\\ \_\\"\_\\/\_____\ ]],
[[    \/_/  \/_/\/_/ \/_/ \/_/ \/_____/ ]],
}
db.custom_footer = {
  'Hello'
}

