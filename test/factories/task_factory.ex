defmodule Todo.Factories.TaskFactory do
  alias Todo.Task

  defmacro __using__(_opts) do
    quote do
      def task_factory do
        %Task{
          title: Faker.Lorem.sentence(),
          description: Faker.Lorem.paragraph()
        }
      end
    end
  end
end