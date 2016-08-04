defmodule Bootstrap3Helper.Nav do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Phoenix.HTML.Link, only: [link: 2]

  def nav_item([active: true], [do: content]), do: nav_item(content, active: true)
  def nav_item(content, [active: true]) do
    content_tag :li, content, class: "active"
  end
  def nav_item([active: false], [do: content]), do: nav_item(content)
  def nav_item(content, [active: false]), do: nav_item(do: content)
  def nav_item([do: content]), do: nav_item(content)
  def nav_item(content) do
    content_tag :li, content, []
  end

  def nav_link(opts, [do: content]), do: nav_link(content, opts)
  def nav_link(content, opts) do
    nav_item([active: Keyword.get(opts, :active, false)]) do
      link content, Keyword.delete(opts, :active)
    end
  end
end
