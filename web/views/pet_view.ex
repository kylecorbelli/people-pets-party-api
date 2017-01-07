defmodule PeoplePetsParty.PetView do
  use PeoplePetsParty.Web, :view
  use JaSerializer.PhoenixView

  attributes [ :name, :age, :animal, :image_url ]

  has_many :people,
    serializer: PeoplePetsParty.PersonView
end

