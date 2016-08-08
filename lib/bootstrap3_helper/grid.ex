defmodule Bootstrap3Helper.Grid do
  import Phoenix.HTML.Tag, only: [content_tag: 3]

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
    classnames = [
      ([:xs, :sm, :md, :lg] |> Enum.map(fn k -> Keyword.has_key?(opts, k) && " col-#{k}-#{opts[k]}" || "" end)) |
      ([:xs_offset, :sm_offset, :md_offset, :lg_offset] |> Enum.map(fn k -> Keyword.has_key?(opts, k) && " col-#{k}-offset-#{opts[k]}" || "" end))
    ]
    content_tag :div, content, class: "col" <> Enum.join(classnames, "")
  end
end
