defmodule Labs.Newsletter do

  def add_email(email) do
    case validate_format(email) do
      :ok ->
        Mailchimp.add_member("409cafb835", email)
      {:error, reason} -> {:error, reason}
    end
  end

  def validate_format(email) do
    if Regex.match? ~r/.*@.*\..*/, email do
      :ok
    else
      {:error, "Not a valid email address."}
    end
  end

end
