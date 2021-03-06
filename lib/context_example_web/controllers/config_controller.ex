defmodule ContextExampleWeb.ConfigController do
  use ContextExampleWeb, :controller

  alias ContextExample.Accounts
  alias ContextExample.Accounts.Config

  def index(conn, _params) do
    config = Accounts.list_config()
    render(conn, "index.html", config: config)
  end

  def new(conn, _params) do
    changeset = Accounts.change_config(%Config{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"config" => config_params}) do
    case Accounts.create_config(config_params) do
      {:ok, config} ->
        conn
        |> put_flash(:info, "Config created successfully.")
        |> redirect(to: Routes.config_path(conn, :show, config))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    config = Accounts.get_config!(id)
    render(conn, "show.html", config: config)
  end

  def edit(conn, %{"id" => id}) do
    config = Accounts.get_config!(id)
    changeset = Accounts.change_config(config)
    render(conn, "edit.html", config: config, changeset: changeset)
  end

  def update(conn, %{"id" => id, "config" => config_params}) do
    config = Accounts.get_config!(id)

    case Accounts.update_config(config, config_params) do
      {:ok, config} ->
        conn
        |> put_flash(:info, "Config updated successfully.")
        |> redirect(to: Routes.config_path(conn, :show, config))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", config: config, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    config = Accounts.get_config!(id)
    {:ok, _config} = Accounts.delete_config(config)

    conn
    |> put_flash(:info, "Config deleted successfully.")
    |> redirect(to: Routes.config_path(conn, :index))
  end
end
