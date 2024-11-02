local config = function()
	local material_icons = require("nvim-material-icon")
	local devicons = require("nvim-web-devicons")

	material_icons.setup({
		override = {
			zsh = {
				icon = "",
				color = "#428850",
				cterm_color = "65",
				name = "Zsh",
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
		[".prettierignore"] = {
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
			name = "envdevelopment",
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
		[".htaccess"] = {
			icon = "",
			color = "#0054c9",
			cterm_color = "32",
			name = "Htaccess",
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
		["tailwind.config.ts"] = {
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
		[".eslintignore"] = {
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
end

return {
	{
		"DaikyXendo/nvim-material-icon",
		config = config,
	},
}
