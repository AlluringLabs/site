defmodule Labs.NewsletterController do
  use Labs.Web, :controller

  alias Labs.{Repo, Contact, Mailer}

  def submit(conn, %{"newsletter" => contact_params}) do
    # Do Stuff
  end

  def success(conn, _) do
    # Do Stuff
  end

end
