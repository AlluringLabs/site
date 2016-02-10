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

    # Just some Static pages
    get "/", PageController, :index
    get "/about", PageController, :about
    get "/contact", PageController, :contact
    get "/contact/success", PageController, :contact_success
    post "/contact/submit", PageController, :contact_submit

    # More dynamic pages
    get "/showcase", PageController, :showcase
    get "/code", PageController, :code

    get "/articles", PostController, :index
    get "/articles/:slug", PostController, :show

    # TODO: change to delete before deployment
    get "/logout", SessionController, :delete
  end

  scope "/admin", Labs do
    pipe_through :browser

    get "/", AdminController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create

    get "/posts", AdminController, :posts
    resources "/posts", PostController, except: [:index, :show]
  end
end
