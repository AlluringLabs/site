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

    # Informational Pages
    get "/", PageController, :index
    get "/about", PageController, :about

    # Newsletter
    # post "/newsletter/submit", NewsletterController, :submit
    # post "/newsletter/success", NewsletterController, :success

    # Contact Us
    get "/contact", ContactController, :index
    get "/contact/success", ContactController, :success
    post "/contact/submit", ContactController, :submit

    # Articles
    get "/articles", PostController, :index
    get "/articles/:slug", PostController, :show

    # More dynamic pages
    # get "/showcase", PageController, :showcase
    # get "/code", PageController, :code

    get "/logout", SessionController, :delete
    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/admin", Labs do
    pipe_through :browser

    get "/", AdminController, :index
    resources "/posts", PostController, except: [:index, :show]

  end
end
