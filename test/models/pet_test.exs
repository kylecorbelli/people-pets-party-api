defmodule PeoplePetsParty.PetTest do
  use PeoplePetsParty.ModelCase

  alias PeoplePetsParty.Pet

  @valid_attrs %{age: 42, name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pet.changeset(%Pet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pet.changeset(%Pet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
