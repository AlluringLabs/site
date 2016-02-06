defmodule Labs.Plugs.Admin do
  use Labs.Web, :controller

  def init(default), do: default
  def call(conn, _) do
    conn |> put_layout("admin.html")
  end

end
