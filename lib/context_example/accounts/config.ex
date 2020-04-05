defmodule ContextExample.Accounts.Config do
  use Ecto.Schema
  import Ecto.Changeset

  schema "config" do
    field :filter_name, :boolean, default: false
    field :filter_status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(config, attrs) do
    config
    |> cast(attrs, [:filter_name, :filter_status])
    |> validate_required([:filter_name, :filter_status])
  end
end
