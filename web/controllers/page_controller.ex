defmodule Labs.PageController do
  use Labs.Web, :controller

  alias Labs.{Post, Repo, Contact, Mailer}

  def index(conn, _params) do
    posts = from p in Post, limit: 3, preload: [:user]
    render conn, "index.html",
      posts: Repo.all posts
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

  def contact_success(conn, _params) do
    render conn, "contact-success.html"
  end

  def contact(conn, _params) do
    changeset = Contact.changeset(%Contact{})
    render conn, "contact.html", changeset: changeset
  end

  def contact_submit(conn, %{"contact" => contact_params}) do
    changeset = Contact.changeset(%Contact{}, contact_params)

    case Repo.insert changeset do
      {:ok, changeset} ->
        Mailer.send_contact_email(changeset)
        # Change to redirect to a thank you page
        redirect conn, to: page_path(conn, :contact_success)
      {:error, changeset} -> render conn, "contact.html", changeset: changeset
    end
  end

end
