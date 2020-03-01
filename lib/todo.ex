defmodule Todo do
  @moduledoc """
  Documentation for `Todo`.
  """

  def start do
    IO.puts("Starting...")
    run("l")
  end

  defp run(option) do
    Repository.create
    case option do
      "l" ->
        Console.list
        Console.list_options
        option = Console.gets_list_option
        run(option)
      "s" ->
        task = IO.gets("\nWhat is the id?\n id: ")
             |> String.trim
             |> Repository.find

        unless task, do: raise "Invalid id"
        Console.show(task)
      "r" ->
        Repository.drop
        run("l")
      "e" ->
        IO.puts("Bye!")
    end
  end
end
