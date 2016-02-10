defmodule Labs.ContactController do
  use Labs.Web, :controller

  alias Labs.{Repo, Contact, Mailer}

  def index(conn, _) do
    changeset = Contact.changeset(%Contact{})
    render conn, "index.html", changeset: changeset
  end

  def submit(conn, %{"contact" => contact_params}) do
    changeset = Contact.changeset(%Contact{}, contact_params)
    case Repo.insert changeset do
      {:ok, changeset} ->
        Mailer.send_contact_email(changeset)
        redirect conn, to: contact_path(conn, :success)
      {:error, changeset} ->
        render conn, "index.html", changeset: changeset
    end
  end

  def success(conn, _) do
    render conn, "success.html"
  end

end
