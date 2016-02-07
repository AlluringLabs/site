defmodule Labs.Plugs.Admin do
  use Labs.Web, :controller

  def init(default), do: default
  def call(conn, _) do
    put_layout(conn, "admin.html")
  end

end
