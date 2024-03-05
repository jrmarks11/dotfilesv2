local ls = require("luasnip") -- Load the LuaSnip package
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

local elixir_snippets = {
  s("i", { t({"IO.inspect("}), i(1), t({")"}), i(0) }),
  s("pry", { t({ "require IEx", "IEx.pry" }), i(0) }),
  s("p", { t("|> "), i(0) }),
  s("fn", {t("fn "), i(1, "params"), t(" -> "), i(0), t(" end")}),
  s("m", {t("%{"), i(0), t("}")}),
  s("ne", {t("=~ "), i(0)}),
  s("ok", { t("{:ok, "), i(1), t(" }") }),
  s("err", { t("{:error, "), i(1), t(" }") }),

  s(
    "test",
    fmt("test \"{}\", %{{conn: conn}} do\n  {}\nend", {
      i(1, "name"),
      i(0, "# test")
    })
  ),
  s(
    "desc",
    fmt("describe \"{}\" do\n  {}\nend", {
      i(1, "test group subject"),
      i(0, "# description")
    })
  ),
  s(
    "def",
    fmt("def {}({}) do\n  {}\nend", {
      i(1, "name"),
      i(2, "params"),
      i(0, "# function")
    })
  ),
  s(
    "defp",
    fmt("defp {}({}) do\n  {}\nend", {
      i(1, "name"),
      i(2, "params"),
      i(0, "# function")
    })
  ),
}

-- Add the snippets to LuaSnip
ls.add_snippets("elixir", elixir_snippets)
