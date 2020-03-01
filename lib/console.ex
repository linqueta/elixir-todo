defmodule Console do
  @moduledoc """
  Console functions.
  """

  def list do
    IO.puts("")
    header_list()
    Repository.list
    |> Enum.map(fn item -> prepare(item) end)
    |> Enum.map(fn item -> list_line(item) end)
    |> Enum.each(fn item -> IO.puts(item) end)
    footer_list()
  end

  def list_options do
    IO.puts("\nWhat do you wanna do?")
    IO.puts("l - List items")
    IO.puts("s - Show an item")
    IO.puts("r - Reset repository")
    IO.puts("e - Exit")
  end

  def gets_list_option do
    option = IO.gets("(l|s|r|e): ")
             |> String.trim
    unless Enum.member?(["l", "s", "r", "e"], option), do: raise "Invalid option"

    option
  end

  def show(item) do
    IO.puts("")
    map = Map.from_struct(item)
    size = Enum.map(map, fn {_k, value} -> String.length(value || "") end)
           |> Enum.max

    header_show(size)
    Enum.each(map, fn {key, value} -> draw_column(key, value, size) end)
    footer_show(size)
  end

  defp prepare(item) do
    %{item |
        title: truncate(item.title),
        description: truncate(item.description)
      }
  end

  defp list_line(item) do
    "| #{String.pad_trailing(item.id, 36)} | #{String.pad_trailing(item.title, 15)} | #{String.pad_trailing(item.description, 15)} |"
  end

  defp header_list do
    line(74)
    IO.puts("|                  id                  |      title      |   description   |")
    line(74)
  end

  defp header_show(size) do
    line(size + 21)
    prefix_length = Kernel.trunc(Float.floor((size-3)/2))
    suffix_length = size - 2 - prefix_length
    prefix = String.duplicate(" ", prefix_length)
    suffix = String.duplicate(" ", suffix_length)
    IO.puts("|      field      |#{prefix}value#{suffix}|")
    line(size + 21)
  end

  defp draw_column(key, value, size) do
    key = String.pad_trailing(Atom.to_string(key), 15)
    value = String.pad_trailing(value || "", 1 + size)
    IO.puts("| #{key} | #{value} |")
  end

  def footer_show(size) do
    line(size + 21)
  end

  def line(size) do
    IO.puts(" #{String.duplicate("-", size)}")
  end

  defp footer_list do
    line(74)
  end

  defp truncate(text) do
    cond do
      String.length(text || "") > 15 -> "#{String.slice(text, 0, 12)}..."
      text == nil -> ""
      true -> text
    end
  end
end
