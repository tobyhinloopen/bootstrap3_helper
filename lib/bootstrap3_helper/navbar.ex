defmodule Bootstrap3Helper.Navbar do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Bootstrap3Helper.HtmlOpts, only: [add_class: 2]
  import Bootstrap3Helper.Helper, only: [add_aliases: 1]
  import Bootstrap3Helper.Grid, only: [container: 1]

  @navbar_collapse_id "navbar-collapse"

  add_aliases(:navbar)
  def navbar(content, opts) do
    content_tag :nav, container(content), add_class(opts, "navbar navbar-default")
  end

  add_aliases(:navbar_header)
  def navbar_header(content, opts) do
    { navbar_toggle_opts, navbar_header_opts } = Keyword.split(opts, [:data_target])
    content_tag :div, add_class(navbar_header_opts, "navbar-header") do
      [ navbar_toggle(navbar_toggle_opts), content ]
    end
  end

  add_aliases(:navbar_collapse)
  def navbar_collapse(content, opts) do
    opts = opts
      |> Keyword.put_new(:id, @navbar_collapse_id)
      |> add_class("collapse navbar-collapse")
    content_tag :div, content, opts
  end

  add_aliases(:navbar_nav)
  def navbar_nav(content, opts) do
    content_tag :ul, content, add_class(opts, "nav navbar-nav")
  end

  add_aliases(:navbar_nav_right)
  def navbar_nav_right(content, opts), do: navbar_nav(content, add_class(opts, "navbar-right"))

  def navbar_toggle(opts \\ []) do
    opts =
      [ type: "button", aria_expanded: "false", data_target: "##{@navbar_collapse_id}", data_toggle: "collapse" ]
      |> Keyword.merge(opts)
      |> add_class("navbar-toggle collapsed")
    content_tag :button, opts, do: [
      content_tag(:span, "Toggle navigation", class: "sr-only"),
      content_tag(:span, "", class: "icon-bar"),
      content_tag(:span, "", class: "icon-bar"),
      content_tag(:span, "", class: "icon-bar")
    ]
  end
end
