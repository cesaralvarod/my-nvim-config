local g = vim.g

-- filenames like *.xml, *.html, *.xhtml, ...
-- These are the file extensions where this plugin is enabled.

g.closetag_filenames = "*.html,*.xhtml,*.phtml"

-- filenames like *.xml, *.xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.

g.closetag_xhtml_filenames = "*.xhtml,*.jsx"

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.

g.closetag_filetypes = "html,xhtml,phtml"

-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.

g.closetag_xhtml_filetypes = "xhtml,jsx"

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

g.closetag_emptyTags_caseSensitive = 1

-- Shortcut for closing tags, default is '>'

g.closetag_shortcut = ">"

-- Add > at current position without closing the current tag, default is ''

g.closetag_close_shortcut = "<leader>>"

g.closetag_enable_react_fragment = 1
