defmodule Repository do
  @moduledoc """
  File repository
  """

  @doc """
  Insert in repository

  ## Examples

      iex> Repository.insert(%Todo.Task{title: "Title"})
      :ok

  """
  def insert(item) do
    List.flatten([list()], [%{item | id: UUID.uuid1()}])
    |> save
  end

  @doc """
  Update item in repository

  ## Examples

      iex> Repository.insert(%Todo.Task{title: "Title"})
      iex> item = List.last(Repository.list())
      iex> Repository.update(item, %{description: "new description"})
      :ok

  """
  def update(item, attrs) do
    list()
    |> Enum.map(fn list_item -> if list_item.id == item.id, do: Map.merge(list_item, attrs), else: list_item end)
    |> save
  end

  @doc """
  List repository
  """
  def list do
    case File.read(file_name()) do
      {:ok, ""} -> []
      {:ok, content} -> :erlang.binary_to_term(content)
      {:error, _} -> []
    end
  end

  def file_name, do: "todo-repository"

  defp save(content) do
    case File.open(file_name(), [:write]) do
      {:ok, file} ->
        IO.binwrite(file, :erlang.term_to_binary(content))
        File.close(file)
    end
  end
end
