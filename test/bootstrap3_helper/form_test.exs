defmodule Bootstrap3Helper.FormTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Form
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "form_group creates a DIV.form_group" do
    assert safe_to_string(Form.form_group "foo", class: "bar")
      == "<div class=\"bar form-group\">foo</div>"
  end
end
