defmodule Bootstrap3Helper.Components.NavbarTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Navbar
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "navbar creates a NAV.navbar.navbar-default and a DIV.container" do
    assert safe_to_string(Navbar.navbar do: "foo")
      == "<nav class=\"navbar navbar-default\"><div class=\"container\">foo</div></nav>"
  end

  test "navbar_header creates a DIV.navbar_header" do
    assert safe_to_string(Navbar.navbar_header([data_target: "#foo"], do: "foo"))
      == "<div class=\"navbar-header\">#{safe_to_string(Navbar.navbar_toggle data_target: "#foo")}foo</div>"
  end

  test "navbar_toggle creates a BUTTON.navbar-toggle.collapsed" do
    assert safe_to_string(Navbar.navbar_toggle(data_target: "#foo"))
      == "<button aria-expanded=\"false\" class=\"navbar-toggle collapsed\" data-target=\"#foo\" data-toggle=\"collapse\" type=\"button\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button>"
  end

  test "navbar_collapse creates a DIV.navbar-collapse.collapse" do
    assert safe_to_string(Navbar.navbar_collapse([id: "foo"], do: "bar"))
      == "<div class=\"collapse navbar-collapse\" id=\"foo\">bar</div>"
  end

  test "navbar_nav creates UL.nav.navbar-nav" do
    assert safe_to_string(Navbar.navbar_nav(do: "foo"))
      == "<ul class=\"nav navbar-nav\">foo</ul>"
  end

  test "navbar_nav_right creates UL.nav.navbar-nav" do
    assert safe_to_string(Navbar.navbar_nav_right(do: "foo"))
      == "<ul class=\"navbar-right nav navbar-nav\">foo</ul>"
  end
end
