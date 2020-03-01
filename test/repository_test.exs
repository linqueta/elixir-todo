defmodule RepositoryTest do
  use ExUnit.Case
  doctest Repository

  setup do
    File.rm(Repository.file_name)
    File.touch(Repository.file_name)
  end

  test "insert/1 creates an item" do
    assert Enum.count(Repository.list) == 0
    assert Repository.insert(%Todo.Task{title: "Some title", description: "Some description"}) == :ok
    assert Enum.count(Repository.list) == 1
    task = List.first(Repository.list)
    assert task.title == "Some title"
    assert task.description == "Some description"
    assert String.match?(task.id, ~r/[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/) == true
  end

  test "update/2 updates an item" do
    Repository.insert(%Todo.Task{title: "Some title", description: "Some description"})
    assert Enum.count(Repository.list) == 1
    task = List.first(Repository.list)
    assert Repository.update(task, %{title: "New some title"}) == :ok
    assert Enum.count(Repository.list) == 1
    task = List.first(Repository.list)
    assert task.title == "New some title"
    assert task.description == "Some description"
    assert String.match?(task.id, ~r/[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/) == true
  end

  test "list/0 list all items" do
    assert Enum.count(Repository.list) == 0
    Repository.insert(%Todo.Task{title: "Some title", description: "Some description"})
    Repository.insert(%Todo.Task{title: "Some title", description: "Some description"})
    assert Enum.count(Repository.list) == 2
  end
end
