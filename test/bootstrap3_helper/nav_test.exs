defmodule Bootstrap3Helper.NavTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Nav
  import Bootstrap3Helper.HtmlParser

  test "nav_item(active: true) renders LI.active" do
    Nav.nav_item([active: true], do: "Foo")
    |> assert_find("li.active", "Foo")
  end

  test "nav_item(active: false) renders LI" do
    Nav.nav_item([active: false], do: "Foo")
    |> assert_find("li", "Foo")
  end

  test "nav_item() renders LI with do-block" do
    Nav.nav_item("Foo")
    |> assert_find("li", "Foo")
  end

  test "nav_link(active: true) renders LI.active containing a link" do
    Nav.nav_link("Foo", to: "/foo", active: true)
    |> assert_find("li.active a[href=\"/foo\"]", "Foo")
  end

  test "nav_link(active: false, to: /foo) renders LI containing a link" do
    Nav.nav_link("Foo", to: "/foo", active: false)
    |> assert_find("li a[href=\"/foo\"]", "Foo")
  end
end
