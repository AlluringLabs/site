defmodule Labs.Mailer do
  use Mailgun.Client,
      domain: Application.get_env(:labs, :mailgun_domain),
      key: Application.get_env(:labs, :mailgun_key)

  @from "AlluringLabs <info@alluringlabs.com>"

  def email(subject, content) do
    send_email to: "David Jenkins <david@alluringlabs.com>, Josh Kidd <josh@alluringlabs.com>",
               from: @from,
               subject: subject,
               html: content
  end

  def send_contact_email(changeset) do
    response = email "New Contact Request!",
          Phoenix.View.render_to_string(Labs.EmailView, "contact-email.html", %{changeset: changeset})

    case response do
      # Log these responses later down the road.
      {:ok, message} -> IO.puts "Good"
      {:error, status, message} -> IO.puts "Bad"
    end
  end
end
