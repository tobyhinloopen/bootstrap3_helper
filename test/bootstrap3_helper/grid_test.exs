defmodule Bootstrap3Helper.GridTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Grid
  import Bootstrap3Helper.HtmlParser

  test "container creates a DIV.container" do
    Grid.container("Foo", class: "foo")
    |> assert_find("div.foo.container", "Foo")
  end

  test "container escapes unsafe content" do
    Grid.container("<b>")
    |> assert_find("div.container", "<b>")
  end

  test "row creates DIV.row" do
    Grid.row("Foo")
    |> assert_find("div.row", "Foo")
  end

  test "col creates DIV.col" do
    Grid.col("Foo", sm: 4, md_offset: 4)
    |> assert_find(".col.col-sm-4.col-md-offset-4", "Foo")
  end
end
