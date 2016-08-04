defmodule Bootstrap3Helper.NavTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Nav
  import Phoenix.HTML, only: [safe_to_string: 1]
  import Phoenix.HTML.Link, only: [link: 2]

  test "nav_item(active: true) renders LI.active" do
    assert safe_to_string(Nav.nav_item([active: true], do: "foo"))
      == "<li class=\"active\">foo</li>"
  end

  test "nav_item(active: false) renders LI" do
    assert safe_to_string(Nav.nav_item([active: false], do: "foo")) == "<li>foo</li>"
  end

  test "nav_item() renders LI with do-block" do
    assert safe_to_string(Nav.nav_item(do: "foo")) == "<li>foo</li>"
  end

  test "nav_item() renders LI with content-param" do
    assert safe_to_string(Nav.nav_item("foo")) == "<li>foo</li>"
  end

  test "nav_link(active: true) renders LI.active containing a link" do
    assert safe_to_string(Nav.nav_link([to: "/foo", active: true], do: "Foo"))
      == "<li class=\"active\">#{safe_to_string link("Foo", to: "/foo")}</li>"
  end

  test "nav_link(active: false, to: /foo) renders LI containing a link" do
    assert safe_to_string(Nav.nav_link([to: "/foo", active: false], do: "Foo"))
      == "<li>#{safe_to_string link("Foo", to: "/foo")}</li>"
  end

  test "nav_link(Foo, to: /foo) renders LI containing a link" do
    assert safe_to_string(Nav.nav_link("Foo", to: "/foo"))
      == "<li>#{safe_to_string link("Foo", to: "/foo")}</li>"
  end
end
