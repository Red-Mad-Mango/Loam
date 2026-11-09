local M = {}

function M.setup(p)
  if not p or not p.name then
    error("loam: palette is missing a name")
  end

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.o.background = p.mode
  vim.g.colors_name = p.name

  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI
  hl("Normal", { fg = p.fg0, bg = p.bg0 })
  hl("NormalNC", { fg = p.fg0, bg = p.bg0 })
  hl("NormalFloat", { fg = p.fg1, bg = p.bg1 })
  hl("FloatBorder", { fg = p.bg4, bg = p.bg1 })
  hl("SignColumn", { bg = p.bg0 })
  hl("EndOfBuffer", { fg = p.bg0 })
  hl("LineNr", { fg = p.gray })
  hl("CursorLine", { bg = p.bg1 })
  hl("CursorColumn", { bg = p.bg1 })
  hl("CursorLineNr", { fg = p.bright_yellow, bg = p.bg1, bold = true })
  hl("ColorColumn", { bg = p.bg1 })
  hl("Visual", { bg = p.bg3 })
  hl("Search", { fg = p.bg0, bg = p.yellow })
  hl("IncSearch", { fg = p.bg0, bg = p.orange })
  hl("CurSearch", { link = "IncSearch" })
  hl("MatchParen", { fg = p.bright_orange, bold = true })
  hl("Cursor", { fg = p.bg0, bg = p.orange })
  hl("TermCursor", { link = "Cursor" })
  hl("Pmenu", { fg = p.fg1, bg = p.bg1 })
  hl("PmenuSel", { fg = p.fg0, bg = p.bg3 })
  hl("PmenuSbar", { bg = p.bg2 })
  hl("PmenuThumb", { bg = p.gray })
  hl("StatusLine", { fg = p.fg1, bg = p.bg2 })
  hl("StatusLineNC", { fg = p.gray, bg = p.bg1 })
  hl("WinSeparator", { fg = p.bg3 })
  hl("Folded", { fg = p.gray, bg = p.bg1 })
  hl("FoldColumn", { fg = p.gray, bg = p.bg0 })
  hl("NonText", { fg = p.bg4 })
  hl("Whitespace", { link = "NonText" })
  hl("SpecialKey", { fg = p.bg4 })
  hl("Conceal", { fg = p.gray })
  hl("Directory", { fg = p.blue })
  hl("Title", { fg = p.yellow, bold = true })
  hl("ModeMsg", { fg = p.green, bold = true })
  hl("MoreMsg", { fg = p.green })
  hl("WarningMsg", { fg = p.yellow })
  hl("ErrorMsg", { fg = p.bright_red, bold = true })
  hl("Question", { fg = p.blue })

  -- Syntax
  hl("Comment", { fg = p.gray, italic = true })
  hl("Constant", { fg = p.orange })
  hl("String", { fg = p.green })
  hl("Character", { link = "String" })
  hl("Number", { fg = p.yellow })
  hl("Boolean", { link = "Constant" })
  hl("Float", { link = "Number" })
  hl("Identifier", { fg = p.fg1 })
  hl("Function", { fg = p.yellow })
  hl("Statement", { fg = p.red })
  hl("Conditional", { link = "Statement" })
  hl("Repeat", { link = "Statement" })
  hl("Label", { link = "Statement" })
  hl("Exception", { link = "Statement" })
  hl("Keyword", { fg = p.red })
  hl("Operator", { fg = p.fg2 })
  hl("Type", { fg = p.aqua })
  hl("PreProc", { fg = p.purple })
  hl("Special", { fg = p.orange })
  hl("Delimiter", { fg = p.fg2 })
  hl("Underlined", { fg = p.blue, underline = true })
  hl("Todo", { fg = p.bg0, bg = p.yellow, bold = true })
  hl("Error", { fg = p.red })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.bright_red })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.blue })
  hl("DiagnosticHint", { fg = p.aqua })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.aqua })

  -- Diff
  hl("DiffAdd", { fg = p.green, bg = p.bg2 })
  hl("DiffChange", { fg = p.yellow, bg = p.bg2 })
  hl("DiffDelete", { fg = p.red, bg = p.bg2 })
  hl("DiffText", { fg = p.yellow, bg = p.bg3, bold = true })

  -- Treesitter captures
  local ts = {
    ["@comment"] = "Comment",
    ["@string"] = "String",
    ["@number"] = "Number",
    ["@boolean"] = "Boolean",
    ["@constant"] = "Constant",
    ["@function"] = "Function",
    ["@function.builtin"] = "Function",
    ["@keyword"] = "Keyword",
    ["@type"] = "Type",
    ["@variable"] = "Identifier",
    ["@parameter"] = "Identifier",
    ["@property"] = "Identifier",
    ["@punctuation"] = "Delimiter",
    ["@operator"] = "Operator",
    ["@tag"] = "Statement",
    ["@attribute"] = "PreProc",
  }
  for group, target in pairs(ts) do
    hl(group, { link = target })
  end
end

return M

