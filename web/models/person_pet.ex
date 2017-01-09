defmodule PeoplePetsParty.PersonPet do
  use PeoplePetsParty.Web, :model

  schema "people_pets" do
    field :person_id, :integer
    field :pet_id, :integer
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [ :person_id, :pet_id ])
    |> validate_required([ :person_id, :pet_id ])
  end
end
