defmodule Labs.ContactTest do
  use Labs.ModelCase

  alias Labs.Contact

  @valid_attrs %{budget: %{}, created: "2010-04-17 14:00:00", email: "some content", fname: "some content", lname: "some content", phone: "some content", projectinfo: "some content", service: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Contact.changeset(%Contact{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Contact.changeset(%Contact{}, @invalid_attrs)
    refute changeset.valid?
  end
end
