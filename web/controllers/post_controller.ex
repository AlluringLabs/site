defmodule Labs.PostController do
  use Labs.Web, :controller

  alias Labs.{Repo, Post, Taxonomy}

  plug :scrub_params, "post" when action in [:create]
  plug Labs.Plugs.Admin, "before" when not action in [:index, :show]
  plug Labs.Plugs.Authorization, "before" when not action in [:index, :show]

  def index(conn, _) do
    # query = from t in Taxonomy,
    #   where: t.type == "category",
    #   preload: [:post]
    # render conn, "index.html", categories: Repo.all(query)
    query = from p in Post, preload: [:user]
    render conn, "index.html", posts: Repo.all query
  end

  def show(conn, %{"slug" => slug}) do
    query = from p in Post,
      where: p.slug == ^slug,
      preload: [:user]

    render conn, "show.html", post: Repo.one query
  end

  def new(conn, _) do
    post = Post.changeset %Post{}
    render conn, "new.html", post: post
  end

  def create(conn, %{"post" => post_params}) do
    current_user = get_session(conn, :current_user)
    case Post.create post_params, current_user do
      {:ok, post} ->
        conn
        |> put_flash(:info, "post created!")
        |> redirect(to: admin_path(conn, :index))
      {:error, post} ->
        render "new.html", post: post
    end
  end

  def edit(conn, %{"post" => post_params}) do
  end

  def update(conn, %{"post" => post_params}) do
  end

  def delete(conn, id) do
  end

end
