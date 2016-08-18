defmodule Bootstrap3Helper.HtmlOpts do
  def add_class(opts, []), do: opts
  def add_class(opts, [nil]), do: opts
  def add_class(opts, [false]), do: opts
  def add_class(opts, [""]), do: opts
  def add_class(opts, classname) when is_binary(classname), do: add_class(opts, [classname])
  def add_class(nil, classnames), do: add_class([], classnames)
  def add_class(opts, classnames), do: Keyword.put(opts, :class, join_classnames([Keyword.get(opts, :class, nil) | classnames]))

  def join_classnames(classnames) do
    classnames |> Enum.filter(fn cn -> cn && cn != "" end) |> Enum.join(" ")
  end

  @doc """
  Delete a key from the options hash and invoke a callback with the stripped options hash and the
  deleted value. The callback is required to return the options keyword list, which is returned by
  this function. If the value is not present, the callback is not invoked.

    HtmlOpts.extract([foo: "bar"], :foo, &Keyword.put(&1, :data_foo, &2)) #=> [data_foo: "bar"]
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

  def extract_grid_opts(opts) do
    Enum.reduce([:xs, :sm, :md, :lg], opts, fn (key, opts) ->
      opts
      |> extract(key, &add_class(&1, "col-#{key}-#{&2}"))
      |> extract(:"#{key}_offset", &add_class(&1, "col-#{key}-offset-#{&2}"))
    end)
  end
end
