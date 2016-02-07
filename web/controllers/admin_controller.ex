defmodule Labs.AdminController do
  use Labs.Web, :controller

  plug Labs.Plugs.Admin
  plug Labs.Plugs.Authorization

  def index(conn, _) do
    render conn, "index.html"
  end
end
