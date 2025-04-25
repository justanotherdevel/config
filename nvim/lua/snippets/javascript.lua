-- lua/snippets/javascript.lua
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- Define a snippet with the trigger "func"
ls.add_snippets("javascript", {
  s("func", {
    t("function "), i(1, "name"), t("("), i(2, "args"), t({ ") {", "\t" }),
    i(0),     -- Final position
    t({ "", "}" }),
  }),
})
