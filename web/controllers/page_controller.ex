defmodule Labs.PageController do
  use Labs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
