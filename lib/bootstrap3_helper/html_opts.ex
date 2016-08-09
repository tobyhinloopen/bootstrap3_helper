defmodule Bootstrap3Helper.HtmlOpts do
  def add_classnames(opts, []), do: opts
  def add_classnames(opts, [nil]), do: opts
  def add_classnames(opts, [false]), do: opts
  def add_classnames(opts, [""]), do: opts
  def add_classnames(nil, classnames), do: add_classnames([], classnames)
  def add_classnames(opts, classnames), do: Keyword.put(opts, :class, join_classnames([Keyword.get(opts, :class, nil) | classnames]))

  def join_classnames(classnames) do
    classnames |> Enum.filter(fn cn -> cn && cn != "" end) |> Enum.join(" ")
  end

  @doc """
  Delete a key from the options hash and invoke a callback with the stripped options hash and the
  deleted value. The callback is required to return the options keyword list, which is returned by
  this function. If the value is not present, the callback is not invoked.

    HtmlOpts.extract([foo: "bar"], :foo, fn (opts, foo) -> Keyword.put(opts, :data_foo, foo) end)
    #=> [data_foo: "bar"]
  """
  @spec extract(keyword, atom, (keyword, any -> keyword)) :: keyword
  def extract(opts, key, cb) do
    if Keyword.has_key?(opts, key) do
      { extracted_opts, stripped_opts } = Keyword.split(opts, [key])
      cb.(stripped_opts, Keyword.fetch!(extracted_opts, key))
    else
      opts
    end
  end
end
