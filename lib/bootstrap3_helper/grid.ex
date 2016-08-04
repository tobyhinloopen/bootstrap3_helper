defmodule Bootstrap3Helper.Grid do
  import Phoenix.HTML.Tag, only: [content_tag: 3]

  def container([do: content]), do: container(content)
  def container(content) do
    content_tag :div, content, class: "container"
  end
end
