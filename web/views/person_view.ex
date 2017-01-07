defmodule PeoplePetsParty.PersonView do
  use PeoplePetsParty.Web, :view
  use JaSerializer.PhoenixView

  attributes [ :name, :age, :location, :image_url ]

  has_many :pets,
    serializer: PeoplePetsParty.PetView
end

