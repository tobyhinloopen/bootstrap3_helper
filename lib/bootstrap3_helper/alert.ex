defmodule Bootstrap3Helper.Alert do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Bootstrap3Helper.HtmlOpts, only: [extract: 3, add_class: 2]
  import Bootstrap3Helper.Helper, only: [add_aliases: 1]

  add_aliases(:alert_success)
  def alert_success(content, opts), do: alert(content, Keyword.put(opts, :type, :success))

  add_aliases(:alert_info)
  def alert_info(content, opts), do: alert(content, Keyword.put(opts, :type, :info))

  add_aliases(:alert_warning)
  def alert_warning(content, opts), do: alert(content, Keyword.put(opts, :type, :warning))

  add_aliases(:alert_danger)
  def alert_danger(content, opts), do: alert(content, Keyword.put(opts, :type, :danger))

  add_aliases(:alert)
  def alert("", _opts), do: ""
  def alert(nil, _opts), do: ""
  def alert(content, opts) do
    content_tag :p, content, extract(opts, :type, &add_class(&1, "alert alert-#{&2}"))
  end
end
