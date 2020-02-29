defmodule Todo.Task do
  @moduledoc "Task struct"

  @enforce_keys :title
  defstruct id: UUID.uuid1(), title: nil, description: nil

  alias Todo.Task

  @doc """
  Changeset .

  ## Examples
    iex> Todo.Task.changeset(%{}, %{description: "Some description"})
    ** (FunctionClauseError) no function clause matching in Todo.Task.changeset/2

    iex> Todo.Task.changeset(%Todo.Task{title: "Some title"}, %{description: "Some description"})
    %Todo.Task{title: "Some title", description: "Some description"}

    iex> task = %Todo.Task{title: "Some title"}
    iex> Todo.Task.changeset(task, %{description: "Some description"})
    %Todo.Task{title: "Some title", description: "Some description"}
  """
  def changeset(%Task{} = task, attrs) do
    Map.merge(task, attrs)
  end
end