defmodule Labs.User do
  use Labs.Web, :model

  alias Labs.{Repo, User}
  alias Comeonin.Bcrypt

  schema "users" do
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :email_address, :string
    field :bio, :string
    field :password_hash, :string
    field :password, :string, virtual: :true
    field :password_confirm, :string, virtual: :true

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
    |> validate_confirmation(:password)
    |> hash_password()
  end

  @doc """
  Creates a User changeset and inserts into the Repo.
  """
  def create(user_params) do
    changeset = User.changeset(%User{}, user_params)
    Repo.insert changeset
  end

  @doc """
  Takes the password and creates a hash using the `Comeonin.Bcrypt` module.
  """
  defp hash_password(changeset) do
    password_hash = Bcrypt.hashpwsalt(get_change(changeset, :password))
    changeset |> put_change(:password_hash, password_hash)
  end

end
