defmodule Labs.Router do
  use Labs.Web, :router

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

  scope "/", Labs do
    pipe_through :browser # Use the default browser stack

    # Do we want all of the pages in a single controller?
    get "/", PageController, :index
    get "/articles", PostController, :index
    get "/about", PageController, :about
    get "/code", PageController, :code
    get "/showcase", PageController, :showcase
    get "/contact", PageController, :contact

    # TODO: change to delete before deployment
    get "/logout", SessionController, :delete
  end

  scope "/admin", Labs do
    pipe_through :browser

    get "/", AdminController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end
end
