defmodule ContextExample.Repo.Migrations.CreateConfig do
  use Ecto.Migration

  def change do
    create table(:config) do
      add :filter_name, :boolean, default: false, null: false
      add :filter_status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
