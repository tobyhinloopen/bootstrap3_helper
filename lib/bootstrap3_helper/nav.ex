defmodule Bootstrap3Helper.Nav do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Phoenix.HTML.Link, only: [link: 2]
  import Bootstrap3Helper.HtmlOpts, only: [extract: 3, add_class: 2]
  import Bootstrap3Helper.Helper, only: [add_aliases: 1]

  add_aliases(:nav_item)
  def nav_item(content, opts) do
    content_tag :li, content, extract(opts, :active, fn
      (opts, true) -> add_class(opts, "active")
      (opts, _) -> opts
    end)
  end

  add_aliases(:nav_link)
  def nav_link(content, opts) do
    { item_opts, link_opts } = Keyword.split(opts, [:active])
    content |> link(link_opts) |> nav_item(item_opts)
  end
end
