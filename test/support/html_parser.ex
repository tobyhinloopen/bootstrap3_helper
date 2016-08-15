defmodule Bootstrap3Helper.HtmlParser do
  require ExUnit.Assertions

  def assert_find({:safe, _} = html, selector) do
    Phoenix.HTML.safe_to_string(html) |> assert_find(selector)
  end

  def assert_find(html, selector) do
    case Floki.find(html, selector) do
      [elem] -> elem
      [] -> ExUnit.Assertions.flunk("#{html} does not contain #{selector}")
      [_|_] -> ExUnit.Assertions.flunk("#{html} contains multiple #{selector}")
    end
  end

  def assert_find(html, selector, target_text) when is_binary(target_text) do
    assert_find(html, selector)
    |> assert_text(target_text)
  end

  def assert_text(html, target_text) do
    ExUnit.Assertions.assert ^target_text = Floki.text(html)
    html
  end
end
