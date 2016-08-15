defmodule Bootstrap3Helper.Form do
  import Phoenix.HTML.Tag, only: [content_tag: 3]
  import Bootstrap3Helper.HtmlOpts, only: [add_class: 2]
  import Bootstrap3Helper.Helper, only: [add_aliases: 1]

  add_aliases :form_group
  def form_group(content, opts) do
    content_tag :div, content, add_class(opts, "form-group")
  end
end
