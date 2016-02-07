defmodule Labs.PostController do
  use Labs.Web, :controller

  alias Labs.{Repo, Post}

  plug Labs.Plugs.Admin, "before" when not action in [:index, :show]
  plug Labs.Plugs.Authorization, "before" when not action in [:index, :show]

  def index(conn, _) do
    query = from p in Post, preload: [:user]
    render conn, "index.html", posts: Repo.all query
  end

  def show(conn, %{"slug" => slug}) do
    query = from p in Post,
      where: p.slug == ^slug,
      preload: [:user]
      
    render conn, "show.html",
      post: Repo.one query
  end

  def new(conn, _) do
  end

  def create(conn, %{"post" => post_params}) do
  end

  def edit(conn, %{"post" => post_params}) do
  end

  def update(conn, %{"post" => post_params}) do
  end

  def delete(conn, id) do
  end

end
