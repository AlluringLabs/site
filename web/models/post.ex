defmodule Labs.Post do
  use Labs.Web, :model

  alias Labs.{Post, Repo}

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    belongs_to :user, Labs.User

    timestamps
  end

  @required_fields ~w(title body slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:slug)
  end

  def create(params, user_id) do
    changeset = Post.changeset(%Post{}, params)
    |> put_change(:user_id, user_id)
    Repo.insert changeset
  end
end
