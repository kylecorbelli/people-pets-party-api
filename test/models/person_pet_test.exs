defmodule PeoplePetsParty.PersonPetTest do
  use PeoplePetsParty.ModelCase

  alias PeoplePetsParty.PersonPet

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PersonPet.changeset(%PersonPet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PersonPet.changeset(%PersonPet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
