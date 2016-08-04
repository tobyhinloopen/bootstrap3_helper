defmodule Bootstrap3Helper.Components.NavbarTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Components.Navbar
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "navbar creates a NAV element" do
    assert safe_to_string(Navbar.navbar do: "foo")
      == "<nav class=\"navbar navbar-default\">foo</nav>"
  end

  test "navbar_header creates a DIV.navbar_header" do
    assert safe_to_string(Navbar.navbar_header([target_id: "foo"], do: "foo"))
      == "<div class=\"navbar-header\">#{safe_to_string(Navbar.navbar_toggle target_id: "foo")}foo</div>"
  end

  test "navbar_toggle creates a BUTTON.navbar-toggle.collapsed" do
    assert safe_to_string(Navbar.navbar_toggle(target_id: "foo"))
      == "<button aria-expanded=\"false\" class=\"navbar-toggle collapsed\" data-target=\"#foo\" data-toggle=\"collapse\" type=\"button\"><span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button>"
  end
end
