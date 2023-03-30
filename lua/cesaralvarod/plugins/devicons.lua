return {
	"nvim-tree/nvim-web-devicons",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
	},
	config = function()
		local material_icons = require("nvim-material-icon")

		material_icons.setup({
			-- your personnal icons can go here (to override)
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
				fish = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Fish",
				},
			},
			color_icons = true,
			default = true,
		})

		material_icons.set_icon({
			astro = {
				icon = "󱓞",
				color = "#ff5e00",
				cterm_color = "65",
				name = "Astro",
			},
			[".prettierrc"] = {
				icon = "",
				color = "#ea5e5e",
				cterm_color = "167",
				name = "Prettier",
			},
			[".dockerignore"] = {
				icon = "",
				color = "#0087c9",
				cterm_color = "32",
				name = "DockerIgnore",
			},
			["docker-compose.yml"] = {
				icon = "",
				color = "#0087c9",
				cterm_color = "32",
				name = "DockerCompose",
			},
			[".env.development"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "EnvDevelopment",
			},
			[".env.production"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "EnvProduction",
			},
			[".env.template"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "EnvTemplate",
			},
			[".env.test"] = {
				icon = "",
				color = "#faf743",
				cterm_color = "227",
				name = "EnvTest",
			},
			["tailwind.config.cjs"] = {
				icon = "󱏿",
				color = "#0087c9",
				cterm_color = "32",
				name = "Tailwind",
			},
			["tailwind.config.js"] = {
				icon = "󱏿",
				color = "#0087c9",
				cterm_color = "32",
				name = "Tailwind",
			},
			[".eslintrc"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
			[".eslintrc.cjs"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
			[".eslintrc.js"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
			[".eslintrc.json"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
			[".eslintrc.yaml"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
			[".eslintrc.yml"] = {
				icon = "",
				color = "#4bc2c3",
				cterm_color = "32",
				name = "Eslint",
			},
		})

		require("nvim-web-devicons").setup({
			override = material_icons.get_icons(),
		})
	end,
}
