defmodule Labs.Session do
  alias Labs.User
  alias Labs.Repo
  alias Comeonin.Bcrypt

  def login([username: username, password: password]) do
    user = User.get_by username: username
    case authenticate(user, password) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  def authenticate(user, password) do
    case user do
      nil -> false
      _   -> Bcrypt.checkpw(password, user.password_hash)
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)
end
