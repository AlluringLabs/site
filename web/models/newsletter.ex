defmodule Labs.Newsletter do
  use Labs.Web, :model

  schema "newsletter" do
    field :email, :string
  end

  @required_fields ~w(email)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> validate_format(:email, ~r/.*@.*\..*/)
    |> cast(params, @required_fields, @optional_fields)
  end
end
