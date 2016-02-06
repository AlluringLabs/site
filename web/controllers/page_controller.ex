defmodule Labs.PageController do
  use Labs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def code(conn, _params) do
    render conn, "code.html"
  end

  def showcase(conn, _params) do
    render conn, "showcase.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end
  
end
