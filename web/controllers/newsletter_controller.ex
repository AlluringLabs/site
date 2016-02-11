defmodule Labs.NewsletterController do
  use Labs.Web, :controller

  plug :scrub_params, "newsletter" when action in [:submit]

  alias Labs.{Newsletter}

  def submit(conn, %{"newsletter" => %{"email" => email}}) do
    IO.inspect email
    member = Mailchimp.add_member("409cafb835", email)
    IO.inspect member
    # Newsletter.add_email email
    redirect conn, to: "/"
  end

  def success(conn, _) do
    # Do Stuff
  end

end
