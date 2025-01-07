return {
    "gelguy/wilder.nvim",

	  event = 'CmdlineEnter',

    config = function()
      local wilder = require('wilder')

      wilder.setup({
        modes = {':', '/', '?'},
        next_key = '<Tab>',
			  previous_key = '<S-Tab>',
      })

    end

}
