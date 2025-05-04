return {
  kind = {
    Array = "󰅪", -- nf-md-code_array
    Boolean = "", -- nf-cod-symbol_boolean
    Class = "󰠱", -- nf-md-alpha_c_box
    Color = "󰏘", -- nf-md-palette
    Constant = "", -- nf-seti-constant
    Constructor = "", -- nf-oct-tools
    Enum = "", -- nf-fa-list_alt
    EnumMember = "", -- mismo que Enum
    Event = "", -- nf-fa-bolt
    Field = "󰜢", -- nf-md-code_string
    File = "󰈙", -- nf-md-file
    Folder = "󰉋", -- nf-md-folder
    Function = "󰊕", -- nf-md-function_variant
    Interface = "", -- nf-fa-sitemap
    Key = "", -- nf-cod-key
    Keyword = "󰌋", -- nf-md-key
    Method = "󰆧", -- nf-md-function
    Module = "", -- nf-cod-symbol_module
    Namespace = "", -- nf-cod-symbol_namespace
    Null = "󰟢", -- alternativo: 󰟢
    Number = "", -- nf-cod-symbol_numeric
    Object = "", -- nf-cod-symbol_namespace (reutilizado)
    Operator = "󰆕", -- nf-md-math_operation
    Package = "", -- nf-cod-symbol_package
    Property = "", -- nf-cod-symbol_property
    Reference = "󰈇", -- nf-md-reference
    Snippet = "", -- nf-oct-bookmark
    String = "", -- nf-cod-symbol_string
    Struct = "󰙅", -- nf-md-domain
    Text = "󰉿", -- nf-md-text
    Default = "󰉿", -- igual que Text
    TypeParameter = "󰊄", -- alternativa: símbolo genérico de tipo
    Unit = "󰑭", -- nf-md-ruler
    Value = "󰎠", -- nf-md-clipboard_text
    Variable = "󰀫", -- nf-md-variable
  },
  git = {
    LineAdded = "", -- nf-oct-diff_added
    LineModified = "", -- nf-oct-diff_modified
    LineRemoved = "", -- nf-oct-diff_removed
    FileDeleted = "", -- nf-oct-file_deleted
    FileIgnored = "◌", -- símbolo neutro, puede quedarse igual
    FileRenamed = "", -- nf-oct-diff_renamed
    FileStaged = "", -- nf-fa-check_square
    FileUnmerged = "", -- nf-dev-git_merge
    FileUnstaged = "", -- nf-oct-diff_unstaged
    FileUntracked = "", -- nf-oct-question
    Diff = "", -- nf-oct-diff
    Repo = "", -- nf-oct-repo
    Octoface = "", -- nf-oct-mark_github
    Branch = "", -- nf-oct-git_branch
  },
  ui = {
    ArrowCircleDown = "", -- fa-arrow-circle-down
    ArrowCircleLeft = "", -- fa-arrow-circle-left
    ArrowCircleRight = "", -- fa-arrow-circle-right
    ArrowCircleUp = "", -- fa-arrow-circle-up

    BoldArrowDown = "", -- fa-arrow-down
    BoldArrowLeft = "", -- fa-arrow-left
    BoldArrowRight = "", -- fa-arrow-right
    BoldArrowUp = "", -- fa-arrow-up

    BoldClose = "", -- fa-times-circle
    BoldDividerLeft = "", -- powerline
    BoldDividerRight = "", -- powerline
    BoldLineLeft = "▎", -- linea vertical decorativa

    BookMark = "", -- cod-bookmark
    BoxChecked = "", -- fa-check-square
    Bug = "", -- cod-bug
    Stacks = "", -- cod-symbol_structure
    Scopes = "", -- dev-debug
    Watches = "", -- fa-eye (simboliza observación)
    DebugConsole = "", -- cod-debug-console

    Calendar = "", -- cod-calendar
    Check = "✓", -- checkmark simple
    ChevronRight = ">", -- fallback simple
    ChevronShortDown = "", -- oct-chevron-down
    ChevronShortLeft = "", -- oct-chevron-left
    ChevronShortRight = "", -- oct-chevron-right
    ChevronShortUp = "", -- oct-chevron-up

    Circle = "", -- fa-circle
    Close = "󰅙", -- material-close-circle
    CloudDownload = "", -- cod-cloud-download
    Code = "", -- cod-code
    Comment = "", -- cod-comment-discussion
    Dashboard = "", -- cod-dashboard

    DividerLeft = "", -- powerline separator
    DividerRight = "", -- powerline separator
    DoubleChevronRight = "»", -- símbolo de doble ángulo

    Ellipsis = "", -- cod-ellipsis
    EmptyFolder = "󰉖", -- md-folder-outline
    EmptyFolderOpen = "󰷏", -- custom-folder-open-outline
    File = "", -- cod-file
    FileSymlink = "", -- oct-file-symlink-file
    Files = "", -- cod-files
    FileWithText = "", -- oct-file-text
    FindFile = "󰱼", -- md-file-find
    FindText = "󱎸", -- md-text-search
    Fire = "", -- cod-flame

    Folder = "", -- dev-folder
    FolderOpen = "󰝰", -- md-folder-open
    FolderSymlink = "󰴋", -- custom-folder-symlink

    Forward = "", -- fa-arrow-right
    Gear = "", -- cod-settings
    History = "", -- cod-history
    Lightbulb = "", -- cod-lightbulb
    LineLeft = "▏", -- línea izquierda
    LineMiddle = "│", -- línea central

    List = "", -- cod-list-ordered
    Lock = "", -- cod-lock
    NewFile = "", -- cod-new-file
    Note = "", -- cod-note
    Package = "", -- cod-package
    Pencil = "", -- fa-pencil
    Plus = "+", -- simple más

    Project = "", -- cod-project
    Search = "", -- cod-search
    SignIn = "", -- cod-sign-in
    SignOut = "", -- cod-sign-out

    Tab = "󰌒", -- custom-tab
    Table = "", -- cod-table
    Target = "", -- fa-crosshairs
    Telescope = "", -- fa-search (por compatibilidad)
    Text = "", -- seti-file-text
    Tree = "", -- fa-tree
    Triangle = "󰔶", -- custom-triangle (o unicode)
    TriangleShortArrowDown = "", -- oct-triangle-down
    TriangleShortArrowLeft = "", -- oct-triangle-left
    TriangleShortArrowRight = "", -- oct-triangle-right
    TriangleShortArrowUp = "", -- oct-triangle-up
  },
  diagnostics = {
    BoldError = "", -- fa-times-circle
    Error = "", -- cod-error
    BoldWarning = "", -- fa-exclamation-triangle
    Warning = "", -- cod-warning
    BoldInformation = "", -- fa-info-circle
    Information = "", -- cod-info
    BoldQuestion = "", -- fa-question-circle
    Question = "", -- cod-question
    BoldHint = "", -- cod-lightbulb
    Hint = "󰌶", -- md-lightbulb-outline
    Debug = "", -- cod-debug
    Trace = "✎", -- unicode pencil (alternativa visual de tracing/logging)
  },
  signslsp = {
    Error = "", -- fa-times-circle
    Warning = "", -- fa-exclamation-triangle
    Hint = "", -- cod-lightbulb
    Information = "", -- fa-info-circle
  },
  misc = {
    Robot = "",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "",
    Package = "",
    CircuitBoard = "",
  },
}
