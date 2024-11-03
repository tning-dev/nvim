local preview_nvim = {
  'https://gitlab.com/itaranto/plantuml.nvim',
  version = '*',
  config = function() require('plantuml').setup() end,
}

return {preview_nvim}


