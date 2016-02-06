defmodule Labs.User do
  use Labs.Web, :model

  schema "users" do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string
    field :bio, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirm, :string, virtual: true

    timestamps
  end

  @required_fields ~w(username email_address password password_confirm)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email_address)
    |> unique_constraint(:username)
    |> validate_format(:email_address, ~r/@/)
  end
end
