defmodule ContextExampleWeb.PageController do
  use ContextExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
