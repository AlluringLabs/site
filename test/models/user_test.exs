defmodule Labs.UserTest do
  use Labs.ModelCase

  alias Labs.User

  @valid_attrs %{bio: "some content", email_address: "some content", first_name: "some content", last_name: "some content", password_hash: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
