defmodule Bootstrap3Helper.FormTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Form
  import Bootstrap3Helper.HtmlParser

  test "form_group creates a DIV.form_group" do
    Form.form_group("Foo", class: "bar")
    |> assert_find("div.bar.form-group", "Foo")
  end
end
