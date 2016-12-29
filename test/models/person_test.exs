defmodule PeoplePetsParty.PersonTest do
  use PeoplePetsParty.ModelCase

  alias PeoplePetsParty.Person

  @valid_attrs %{age: 42, location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
