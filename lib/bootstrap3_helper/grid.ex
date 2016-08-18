defmodule Bootstrap3Helper.Grid do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Bootstrap3Helper.HtmlOpts, only: [add_class: 2, extract_grid_opts: 1]
  import Bootstrap3Helper.Helper, only: [add_aliases: 1]

  add_aliases(:container)
  def container(content, opts) do
    content_tag :div, content, add_class(opts, "container")
  end

  add_aliases(:row)
  def row(content, opts) do
    content_tag :div, content, add_class(opts, "row")
  end

  add_aliases(:col)
  def col(content, opts) do
    content_tag :div, content, extract_grid_opts(opts)
  end
end
