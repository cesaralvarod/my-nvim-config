return {
	"esensar/nvim-dev-container",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	cmd = {
		"DevcontainerBuild",
		"DevcontainerImageRun",
		"DevcontainerBuildAndRun",
		"DevcontainerBuildRunAndAttach",
		"DevcontainerComposeUp",
		"DevcontainerComposeDown",
		"DevcontainerComposeRm",
		"DevcontainerStartAuto",
		"DevcontainerStartAutoAndAttach",
		"DevcontainerAttachAuto",
		"DevcontainerStopAuto",
		"DevcontainerStopAll",
		"DevcontainerRemoveAll",
		"DevcontainerLogs",
		"DevcontainerOpenNearestConfig",
		"DevcontainerEditNearestConfig",
	},
	config = true,
}
