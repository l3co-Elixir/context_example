defmodule ContextExampleWeb.Router do
  use ContextExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ContextExampleWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController

    resources "/config", ConfigController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ContextExampleWeb do
  #   pipe_through :api
  # end
end
