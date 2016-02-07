defmodule Labs.Plugs.Authorization do
  use Labs.Web, :controller
  alias Plug.Conn

  def init(default), do: default
  def call(conn, _) do
    if Conn.get_session(conn, :current_user) do
      conn
    else
      conn |> redirect(to: "/admin/login")
    end
  end

end
