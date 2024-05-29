local core = require("nougat.core")
local Bar = require("nougat.bar")
local nougat = require("nougat")
local Item = require("nougat.item")
local sep = require("nougat.separator")

local function paired_space(item)
  return Item({
    content = sep.space().content,
    hidden = item,
  })
end

local nut = {
  buf = {
    diagnostic_count = require("nougat.nut.buf.diagnostic_count").create,
    filename = require("nougat.nut.buf.filename").create,
    filestatus = require("nougat.nut.buf.filestatus").create,
    filetype = require("nougat.nut.buf.filetype").create,
  },
  git = {
    branch = require("nougat.nut.git.branch").create,
    status = require("nougat.nut.git.status"),
  },
  tab = {
    tablist = {
      tabs = require("nougat.nut.tab.tablist").create,
      close = require("nougat.nut.tab.tablist.close").create,
      icon = require("nougat.nut.tab.tablist.icon").create,
      label = require("nougat.nut.tab.tablist.label").create,
      modified = require("nougat.nut.tab.tablist.modified").create,
    },
  },
  servers = require("nougat.nut.lsp.servers").create,
  mode = require("nougat.nut.mode").create,
  spacer = require("nougat.nut.spacer").create,
  truncation_point = require("nougat.nut.truncation_point").create,
}

local color = require("nougat.color").get()

local mode = nut.mode({
  prefix = "  ",
  suffix = " ",
  sep_right = sep.right_upper_triangle_solid(true),
})

local divider = Item({
  hl = {},
  content = "|",
  suffix = " ",
  prefix = " ",
})

local stl = Bar("statusline")
stl:add_item(mode)
stl:add_item(Item({
  hl = { bg = color.bg3 }
}))

stl:add_item(nut.git.branch({
  hl = { bg = color.bg2 },
  prefix = "  ",
  suffix = " ",
  sep_right = sep.right_upper_triangle_solid(true),
  sep_left = sep.left_lower_triangle_solid(true),
}))
stl:add_item(nut.git.status.create({
  hl = { bg = color.bg },
  content = {
    nut.git.status.count("added", {
      hl = { fg = color.green },
      prefix = " +",
    }),
    nut.git.status.count("changed", {
      hl = { fg = color.blue },
      prefix = " ~",
    }),
    nut.git.status.count("removed", {
      hl = { fg = color.red },
      prefix = " -",
    }),
  },
  suffix = " ",
  sep_right = sep.right_chevron_solid(true),
}))

local filename = stl:add_item(nut.buf.filename({
  prefix = " ",
  suffix = " ",
}))
local filestatus = stl:add_item(nut.buf.filestatus({
  suffix = " ",
  config = {
    modified = "󰏫",
    nomodifiable = "󰏯",
    readonly = "",
    sep = " ",
  },
}))
stl:add_item(nut.spacer())
stl:add_item(nut.truncation_point())
stl:add_item(Item({
  prefix = "  ",
  content = core.group({
    core.code("l"),
    ":",
    core.code("c"),
  }),
}))
stl:add_item(divider)
local diagnostic_count = stl:add_item(nut.buf.diagnostic_count({
  hl = { bg = color.bg4 },
  sep_left = sep.left_half_circle_solid(true),
  sep_right = sep.right_half_circle_solid(true),
  config = {
    error = { prefix = " " },
    warn = { prefix = " " },
    info = { prefix = " " },
    hint = { prefix = "󰌶 " },
  },
}))
stl:add_item(paired_space(diagnostic_count))

-- stl:add_item(nut.servers({
--   hl = { bg = color.bg2 },
--   prefix = " ",
--   suffix = " ",
-- }))
stl:add_item(Item({
  sep_left = sep.left_half_circle_solid(true),
  hl = { bg = color.red, fg = color.bg },
  content = "󰈚",
  suffix = " ",
}))
stl:add_item(nut.buf.filetype({
  hl = { bg = color.bg2 },
  prefix = " ",
  suffix = " ",
}))

stl:add_item(Item({
  sep_left = sep.left_half_circle_solid(true),
  hl = { bg = color.green, fg = color.bg },
  content = "",
  suffix = " ",
}))
stl:add_item(Item({
  hl = { fg = color.green, bg = color.bg2 },
  prefix = " ",
  content = core.code("P"),
  suffix = " ",
}))

local stl_inactive = Bar("statusline")
stl_inactive:add_item(mode)
stl_inactive:add_item(filename)
stl_inactive:add_item(filestatus)
stl_inactive:add_item(nut.spacer())

nougat.set_statusline(function(ctx)
  return ctx.is_focused and stl or stl_inactive
end)
