defmodule Labs.Taxonomy do
  use Labs.Web, :model

  schema "taxonomies" do
    field :name, :string
    field :type, :string
    belongs_to :post, Labs.Post

    timestamps
  end

  @required_fields ~w(name type)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
