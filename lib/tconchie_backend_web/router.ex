defmodule TconchieBackendWeb.Router do
  use TconchieBackendWeb, :router

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

  scope "/", TconchieBackendWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", TconchieBackendWeb do
    pipe_through :api

    resources "/entries", EntryController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TconchieBackendWeb do
  #   pipe_through :api
  # end
end
