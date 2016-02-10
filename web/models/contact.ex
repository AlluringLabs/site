defmodule Labs.Contact do
  use Labs.Web, :model

  schema "contact" do
    field :service, :string
    field :budget, :string
    field :projectinfo, :string
    field :fname, :string
    field :lname, :string
    field :email, :string
    field :phone, :string

    timestamps
  end

  @required_fields ~w(service budget projectinfo fname lname email phone)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:fname, min: 1)
    |> validate_length(:lname, min: 1)
    |> validate_length(:phone, min: 1)
    |> validate_length(:projectinfo, min: 1)
    |> validate_inclusion(:service, ["Development", "Design", "Consulting", "Other"])
    |> validate_inclusion(:budget, ["$500 - $1,000", "$1,001 - $2,500",
                                    "$2,501 - $5,000", "$5,001 - $10,000",
                                    "$10,001+"])
    |> validate_format(:email, ~r/.*@.*\..*/)
    |> validate_format(:phone, ~r/(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?/)
  end
end
