defmodule Labs.NewsletterTest do
  use Labs.ModelCase

  alias Labs.Newsletter

  @valid_attrs %{email: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Newsletter.changeset(%Newsletter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Newsletter.changeset(%Newsletter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
