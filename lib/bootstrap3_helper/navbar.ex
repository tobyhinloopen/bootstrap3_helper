defmodule Bootstrap3Helper.Navbar do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  alias Bootstrap3Helper.Grid

  @navbar_collapse_id "navbar-collapse"

  def navbar([do: content]), do: navbar(content)
  def navbar(content) do
    content_tag :nav, class: "navbar navbar-default" do
      Grid.container do: content
    end
  end

  def navbar_header([do: content]), do: navbar_header(content)
  def navbar_header(content), do: navbar_header(content, target_id: @navbar_collapse_id)
  def navbar_header(opts, [do: content]), do: navbar_header(content, opts)
  def navbar_header(content, opts) do
    content_tag :div, class: "navbar-header" do
      [
        navbar_toggle(target_id: opts[:target_id]),
        content
      ]
    end
  end

  def navbar_collapse([do: content]), do: navbar_collapse(content)
  def navbar_collapse(content), do: navbar_collapse(content, id: @navbar_collapse_id)
  def navbar_collapse(opts, [do: content]), do: navbar_collapse(content, opts)
  def navbar_collapse(content, opts) do
    content_tag :div, content, class: "collapse navbar-collapse", id: opts[:id]
  end

  def navbar_nav([do: content]), do: navbar_nav(content)
  def navbar_nav(content) do
    content_tag :ul, content, class: "nav navbar-nav"
  end
  def navbar_nav([class: classname], [do: content]), do: navbar_nav(content, class: classname)
  def navbar_nav(content, [class: classname]) do
    content_tag :ul, content, class: "nav navbar-nav #{classname}"
  end

  def navbar_nav_right([do: content]), do: navbar_nav_right(content)
  def navbar_nav_right(content), do: navbar_nav(content, class: "navbar-right")

  def navbar_toggle(opts) do
    content_tag :button, [
      class: "navbar-toggle collapsed",
      type: "button",
      aria_expanded: "false",
      data_target: "##{opts[:target_id]}",
      data_toggle: "collapse"
    ], do: [
      content_tag(:span, "Toggle navigation", class: "sr-only"),
      content_tag(:span, "", class: "icon-bar"),
      content_tag(:span, "", class: "icon-bar"),
      content_tag(:span, "", class: "icon-bar")
    ]
  end
end
