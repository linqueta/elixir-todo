defmodule Todo do
  @moduledoc """
  Documentation for `Todo`.
  """

  def start do
    IO.puts("Starting...")
    run("l", nil)
  end

  defp run(option, task) do
    Repository.create
    case option do
      "l" ->
        Console.list
        Console.list_options
        option = Console.gets_list_option
        run(option, nil)
      "i" ->
        IO.puts("\nCreating item:")
        attrs = Console.form
        Map.merge(%Todo.Task{}, attrs)
        |> Repository.insert
        run("l", nil)
      "s" ->
        task = IO.gets("\nWhat is the id?\n id: ")
             |> String.trim
             |> Repository.find

        unless task, do: raise "Invalid id"
        Console.show(task)
        Console.show_options
        option = Console.gets_show_option
        run(option, task)
      "u" ->
        IO.puts("\nUpdating item:")
        Repository.update(task, Console.form)
        run("l", nil)
      "r" ->
        Repository.drop
        run("l", nil)
      "e" ->
        IO.puts("Bye!")
    end
  end
end
