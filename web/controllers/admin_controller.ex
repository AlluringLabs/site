defmodule Labs.AdminController do
  use Labs.Web, :controller

  alias Labs.{Post, Repo}

  plug Labs.Plugs.Admin
  plug Labs.Plugs.Authorization

  def index(conn, _) do
    query = from p in Post, preload: [:user]
    render conn, "index.html", posts: Repo.all query
  end
end
