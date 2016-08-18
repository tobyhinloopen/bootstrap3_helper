defmodule Bootstrap3Helper.Helper do
  defmacro add_aliases(func) do
    quote do
      def unquote(func)([do: content]), do: unquote(func)(content)
      def unquote(func)(opts, [do: content]), do: unquote(func)(content, opts)
      def unquote(func)(content), do: unquote(func)(content, [])
    end
  end
end
