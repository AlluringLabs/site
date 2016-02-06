defmodule Labs.SessionController do
  use Labs.Web, :controller

  alias Comeonin.Bcrypt

  def new(conn, _) do
    render "new.html"
  end

  def create(conn, %{"username" => username, "password" => password}) do
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
