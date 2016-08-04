defmodule Bootstrap3Helper.Alert do
  import Phoenix.HTML.Tag, only: [content_tag: 3]

  def alert_success([do: content]), do: alert(:success, content)
  def alert_success(content), do: alert(:success, content)

  def alert_info([do: content]), do: alert(:info, content)
  def alert_info(content), do: alert(:info, content)

  def alert_warning([do: content]), do: alert(:warning, content)
  def alert_warning(content), do: alert(:warning, content)

  def alert_danger([do: content]), do: alert(:danger, content)
  def alert_danger(content), do: alert(:danger, content)

  def alert(_type, ""), do: ""
  def alert(_type, nil), do: ""
  def alert(type, [do: content]), do: alert(type, content)
  def alert(type, content) do
    content_tag :p, content, class: "alert alert-#{type}"
  end
end
