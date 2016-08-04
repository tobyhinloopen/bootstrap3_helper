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
end
