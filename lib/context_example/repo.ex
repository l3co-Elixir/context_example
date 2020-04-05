defmodule ContextExample.Repo do
  use Ecto.Repo,
    otp_app: :context_example,
    adapter: Ecto.Adapters.Postgres
end
