defmodule Bootstrap3Helper.Components.Navbar do
  import Phoenix.HTML.Tag, only: [content_tag: 3]

  def navbar([do: content]) do
    content_tag :nav, content, class: "navbar navbar-default"
  end

  def navbar_header(opts, [do: content]) do
    content_tag :div, class: "navbar-header" do
      [
        navbar_toggle(target_id: opts[:target_id]),
        content
      ]
    end
  end

  def navbar_toggle(opts) do
    content_tag :button, class: "navbar-toggle collapsed", type: "button", aria_expanded: "false", data_target: "##{opts[:target_id]}", data_toggle: "collapse" do
      [
        content_tag(:span, "Toggle navigation", class: "sr-only"),
        content_tag(:span, "", class: "icon-bar"),
        content_tag(:span, "", class: "icon-bar"),
        content_tag(:span, "", class: "icon-bar")
      ]
    end
  end
end
