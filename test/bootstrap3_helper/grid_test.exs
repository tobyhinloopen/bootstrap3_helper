defmodule Bootstrap3Helper.GridTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Grid
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "container creates a DIV.container" do
    assert safe_to_string(Grid.container "foo")
      == "<div class=\"container\">foo</div>"
  end

  test "container escapes unsafe content" do
    assert safe_to_string(Grid.container "<b>")
      == "<div class=\"container\">&lt;b&gt;</div>"
  end

  test "row creates DIV.row" do
    assert safe_to_string(Grid.row "Foo")
      == "<div class=\"row\">Foo</div>"
  end

  test "col creates DIV.col" do
    assert safe_to_string(Grid.col [sm: 4, md_offset: 4], do: "Foo")
      == "<div class=\"col col-sm-4 col-md-offset-4\">Foo</div>"
  end
end
