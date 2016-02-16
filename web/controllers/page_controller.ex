defmodule Labs.PageController do
  use Labs.Web, :controller

  alias Labs.{Contact}

  def index(conn, _params) do
    render conn, "index.html",
      contact_changeset: Contact.changeset(%Contact{})
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

  def privacy(conn, _params) do
    render conn, "privacy-policy.html"
  end

end
