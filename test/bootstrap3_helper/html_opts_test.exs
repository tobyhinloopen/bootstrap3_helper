defmodule Bootstrap3Helper.HtmlOptsTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.HtmlOpts

  test "add_class on nil returns a map with classname" do
    assert HtmlOpts.add_class(nil, ["foo"]) == [class: "foo"]
  end

  test "add_class with empty list does nothing" do
    assert HtmlOpts.add_class([foo: "bar"], []) == [foo: "bar"]
  end

  test "add_class on opts without class creates class key" do
    assert HtmlOpts.add_class([foo: "bar"], ["foo"]) == [class: "foo", foo: "bar"]
  end

  test "add_class with existing class appends class" do
    assert HtmlOpts.add_class([class: "foo"], ["bar"]) == [class: "foo bar"]
  end

  test "add_class with multiple classnames adds all classnames" do
    assert HtmlOpts.add_class(nil, ["foo", "bar"]) == [class: "foo bar"]
  end

  test "add_class with existing opts adds all classnames" do
    assert HtmlOpts.add_class([foo: "bar"], ["foo", "bar"]) == [class: "foo bar", foo: "bar"]
  end

  test "add_class with false does nothing" do
    assert HtmlOpts.add_class([], [false]) == []
  end

  test "add_class with nil does nothing" do
    assert HtmlOpts.add_class([], [nil]) == []
  end

  test "add_class with emtpy string does nothing" do
    assert HtmlOpts.add_class([], [""]) == []
  end

  test "add_class ignores nils, falses and empty strings" do
    assert HtmlOpts.add_class([], ["", nil, false, "foo"]) == [class: "foo"]
  end

  test "add_class with existing class adds all classnames" do
    assert HtmlOpts.add_class([foo: "bar", class: "baz"], ["foo", "bar"])
      == [class: "baz foo bar", foo: "bar" ]
  end

  test "join_classnames strips nils, falses and empty strings and joins the result" do
    assert HtmlOpts.join_classnames(["", nil, false, "foo", "bar"]) == "foo bar"
  end

  test "extract extracts an option" do
    assert HtmlOpts.extract([foo: "bar"], :foo, &Keyword.put(&1, :data_foo, &2))
      == [data_foo: "bar"]
  end
end
