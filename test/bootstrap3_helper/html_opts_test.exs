defmodule Bootstrap3Helper.HtmlOptsTest do
  use ExUnit.Case, async: true
  alias Bootstrap3Helper.HtmlOpts

  test "add_classnames on nil returns a map with classname" do
    assert HtmlOpts.add_classnames(nil, ["foo"]) == [class: "foo"]
  end

  test "add_classnames with empty list does nothing" do
    assert HtmlOpts.add_classnames([foo: "bar"], []) == [foo: "bar"]
  end

  test "add_classnames on opts without class creates class key" do
    assert HtmlOpts.add_classnames([foo: "bar"], ["foo"]) == [class: "foo", foo: "bar"]
  end

  test "add_classnames with existing class appends class" do
    assert HtmlOpts.add_classnames([class: "foo"], ["bar"]) == [class: "foo bar"]
  end

  test "add_classnames with multiple classnames adds all classnames" do
    assert HtmlOpts.add_classnames(nil, ["foo", "bar"]) == [class: "foo bar"]
  end

  test "add_classnames with existing opts adds all classnames" do
    assert HtmlOpts.add_classnames([foo: "bar"], ["foo", "bar"]) == [class: "foo bar", foo: "bar"]
  end

  test "add_classnames with false does nothing" do
    assert HtmlOpts.add_classnames([], [false]) == []
  end

  test "add_classnames with nil does nothing" do
    assert HtmlOpts.add_classnames([], [nil]) == []
  end

  test "add_classnames with emtpy string does nothing" do
    assert HtmlOpts.add_classnames([], [""]) == []
  end

  test "add_classnames ignores nils, falses and empty strings" do
    assert HtmlOpts.add_classnames([], ["", nil, false, "foo"]) == [class: "foo"]
  end

  test "add_classnames with existing class adds all classnames" do
    assert HtmlOpts.add_classnames([foo: "bar", class: "baz"], ["foo", "bar"]) == [class: "baz foo bar", foo: "bar" ]
  end

  test "join_classnames strips nils, falses and empty strings and joins the result" do
    assert HtmlOpts.join_classnames(["", nil, false, "foo", "bar"]) == "foo bar"
  end

  test "extract extracts an option" do
    assert HtmlOpts.extract([foo: "bar"], :foo, fn (opts, foo) -> Keyword.put(opts, :data_foo, foo) end)
      == [data_foo: "bar"]
  end
end
