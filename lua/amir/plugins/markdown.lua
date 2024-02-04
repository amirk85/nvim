return {
	-- obsidian
	{

		"epwalsh/obsidian.nvim",
		version = "*",  -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			require("obsidian").setup({
				use_advanced_uri = true,
				dir = "~/Documents/second-brain",
				-- daily_notes = {
				-- 	folder = "dailies",
				-- },
				completion = {
					nvim_cmp = true,
				},
				note_id_func = function(title)
					local sane_name = ""
					if title ~= nil then
						-- If title is given, transform it into valid file name.
						sane_name = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
					else
						-- If title is nil, just add 4 random uppercase letters to the suffix.
						for _ in 1, 4 do
							sane_name = sane_name .. string.char(math.random(65, 90))
						end
					end
					return sane_name
				end,
			})
		end
	},

	-- plugin for code block
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function ()

			require('headlines').setup({
				markdown = {
					headline_highlights = false,
					-- codeblock_highlight = "CodeBlock",
					-- dash_highlight = "Dash",
					-- dash_string = "-",
					-- quote_highlight = "Quote",
					-- quote_string = "┃",
					-- fat_headlines = true,
					-- fat_headline_upper_string = "▃",
					-- fat_headline_lower_string = "🬂",
				},
			})

		end,
	},
}
