defmodule Labs.SessionController do
  use Labs.Web, :controller

  alias Comeonin.Bcrypt

  plug Labs.Plugs.Admin, "layout" when action in [:new]
  plug :scrub_params, "user" when action in [:create]

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password}}) do
    case Labs.Session.login [username: username, password: password] do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/admin")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password!")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
