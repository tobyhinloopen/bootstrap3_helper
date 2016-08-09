defmodule Bootstrap3Helper.Helper do
  defmacro add_aliases(meth) do
    quote do
      def unquote(meth)([do: content]), do: unquote(meth)(content)
      def unquote(meth)(opts, [do: content]), do: unquote(meth)(content, opts)
      def unquote(meth)(content), do: unquote(meth)(content, [])
    end
  end
end
