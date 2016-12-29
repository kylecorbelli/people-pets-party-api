defmodule PeoplePetsParty.PetView do
  use PeoplePetsParty.Web, :view

  def render("index.json", %{pets: pets}) do
    %{data: render_many(pets, PeoplePetsParty.PetView, "pet.json")}
  end

  def render("show.json", %{pet: pet}) do
    %{data: render_one(pet, PeoplePetsParty.PetView, "pet.json")}
  end

  def render("pet.json", %{pet: pet}) do
    %{id: pet.id,
      name: pet.name,
      age: pet.age,
      type: pet.type}
  end
end
