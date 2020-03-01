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
      "i" ->
        IO.puts("\nNew item:")
        attrs = Console.form
        Map.merge(%Todo.Task{}, attrs)
        |> Repository.insert
        run("l")
      "s" ->
        task = IO.gets("\nWhat is the id?\n id: ")
             |> String.trim
             |> Repository.find

        unless task, do: raise "Invalid id"
        Console.show(task)
        run("l")
      "r" ->
        Repository.drop
        run("l")
      "e" ->
        IO.puts("Bye!")
    end
  end
end
