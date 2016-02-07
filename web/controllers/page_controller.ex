defmodule Labs.PageController do
  use Labs.Web, :controller

  alias Labs.{Post, Repo}

  def index(conn, _params) do
    posts = from p in Post, limit: 3, preload: [:user]
    render conn, "index.html",
      posts: Repo.all posts
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def code(conn, _params) do
    render conn, "code.html"
  end

  def showcase(conn, _params) do
    render conn, "showcase.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end

end
