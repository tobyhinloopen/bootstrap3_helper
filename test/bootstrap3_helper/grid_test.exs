defmodule Bootstrap3Helper.Components.GridTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Grid
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "container creates a DIV.container with do block" do
    assert safe_to_string(Grid.container do: "foo")
      == "<div class=\"container\">foo</div>"
  end

  test "container escapes unsafe content" do
    assert safe_to_string(Grid.container do: "<b>")
      == "<div class=\"container\">&lt;b&gt;</div>"
  end

  test "container with content param" do
    assert safe_to_string(Grid.container "Foo")
      == "<div class=\"container\">Foo</div>"
  end

  test "row with content param creates DIV.row" do
    assert safe_to_string(Grid.row "Foo")
      == "<div class=\"row\">Foo</div>"
  end

  test "row with content block creates DIV.row" do
    assert safe_to_string(Grid.row do: "Foo")
      == "<div class=\"row\">Foo</div>"
  end

  test "col with content block creates DIV.col" do
    assert safe_to_string(Grid.col [sm: 4], do: "Foo")
      == "<div class=\"col col-sm-4\">Foo</div>"
  end

  test "col with content param creates DIV.col" do
    assert safe_to_string(Grid.col "Foo", sm: 4)
      == "<div class=\"col col-sm-4\">Foo</div>"
  end
end
