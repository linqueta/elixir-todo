defmodule RepositoryTest do
  use ExUnit.Case
  doctest Repository

  import Todo.Factory

  setup do
    Repository.drop
    Repository.create
  end

  test "insert/1 creates an item" do
    assert Enum.count(Repository.list) == 0
    task = build(:task)
    assert Repository.insert(task) == :ok
    assert Enum.count(Repository.list) == 1
    listed_task = List.first(Repository.list)
    assert listed_task.title == task.title
    assert listed_task.description == task.description
    assert String.match?(listed_task.id, ~r/[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/) == true
  end

  test "update/2 updates an item" do
    Repository.insert(build(:task))
    assert Enum.count(Repository.list) == 1
    listed_task = List.first(Repository.list)
    assert Repository.update(listed_task, %{title: "New some title"}) == :ok
    assert Enum.count(Repository.list) == 1
    updated_task = List.first(Repository.list)
    assert updated_task.title == "New some title"
    assert updated_task.description == listed_task.description
    assert String.match?(updated_task.id, ~r/[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/) == true
  end

  test "list/0 list all items" do
    assert Enum.count(Repository.list) == 0
    Repository.insert(build(:task))
    Repository.insert(build(:task))
    assert Enum.count(Repository.list) == 2
  end
end
