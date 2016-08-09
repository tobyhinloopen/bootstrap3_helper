defmodule Bootstrap3Helper.Grid do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Bootstrap3Helper.HtmlOpts, only: [add_classnames: 2, extract: 3]

  def container([do: content]), do: container(content)
  def container(content) do
    content_tag :div, content, class: "container"
  end

  def row([do: content]), do: row(content)
  def row(content) do
    content_tag :div, content, class: "row"
  end

  def col(opts, [do: content]), do: col(content, opts)
  def col(content, opts) do
    opts = add_classnames(opts, ["col"])
    opts = Enum.reduce([:xs, :sm, :md, :lg], opts,
      fn (key, opts) ->
        opts
        |> extract(key, &add_classnames(&1, ["col-#{key}-#{&2}"]))
        |> extract(:"#{key}_offset", &add_classnames(&1, ["col-#{key}-offset-#{&2}"]))
      end)
    content_tag :div, content, opts
  end
end
