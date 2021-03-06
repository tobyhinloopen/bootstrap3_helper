defmodule Bootstrap3Helper.AlertTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.Alert
  import Bootstrap3Helper.HtmlParser

  test "alert_info creates a P.alert.alert-info" do
    assert Alert.alert_info("Foo") == Alert.alert("Foo", type: :info)
  end

  test "alert_danger creates a P.alert.alert-danger" do
    assert Alert.alert_danger("Foo") == Alert.alert("Foo", type: :danger)
  end

  test "alert_success creates a P.alert.alert-success" do
    assert Alert.alert_success("Foo") == Alert.alert("Foo", type: :success)
  end

  test "alert_warning creates a P.alert.alert-warning" do
    assert Alert.alert_warning("Foo") == Alert.alert("Foo", type: :warning)
  end

  test "alert creates a P.alert.alert-foo with content" do
    Alert.alert("Foo", type: "foo")
    |> assert_find("p.alert.alert-foo")
    |> assert_text("Foo")
  end
end
