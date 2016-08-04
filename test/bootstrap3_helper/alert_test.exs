defmodule Bootstrap3Helper.Components.AlertTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Alert
  import Phoenix.HTML, only: [safe_to_string: 1]

  test "alert_info creates a P.alert.alert-info with do block" do
    assert Alert.alert_info(do: "Foo") == Alert.alert(:info, "Foo")
  end

  test "alert_info creates a P.alert.alert-info with content" do
    assert Alert.alert_info "Foo" == Alert.alert(:info, "Foo")
  end

  test "alert_danger creates a P.alert.alert-danger with do block" do
    assert Alert.alert_danger(do: "Foo") == Alert.alert(:danger, "Foo")
  end

  test "alert_danger creates a P.alert.alert-danger with content" do
    assert Alert.alert_danger "Foo" == Alert.alert(:danger, "Foo")
  end

  test "alert_success creates a P.alert.alert-success with do block" do
    assert Alert.alert_success(do: "Foo") == Alert.alert(:success, "Foo")
  end

  test "alert_success creates a P.alert.alert-success with content" do
    assert Alert.alert_success "Foo" == Alert.alert(:success, "Foo")
  end

  test "alert_warning creates a P.alert.alert-warning with do block" do
    assert Alert.alert_warning(do: "Foo") == Alert.alert(:warning, "Foo")
  end

  test "alert_warning creates a P.alert.alert-warning with content" do
    assert Alert.alert_warning "Foo" == Alert.alert(:warning, "Foo")
  end

  test "alert creates a P.alert.alert-foo with do block" do
    assert safe_to_string(Alert.alert :foo, do: "Foo") == "<p class=\"alert alert-foo\">Foo</p>"
  end

  test "alert creates a P.alert.alert-foo with content" do
    assert safe_to_string(Alert.alert :foo, "Foo") == "<p class=\"alert alert-foo\">Foo</p>"
  end
end
