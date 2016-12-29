defmodule PeoplePetsParty.Person do
  use PeoplePetsParty.Web, :model

  schema "people" do
    field :name, :string
    field :age, :integer
    field :location, :string
    many_to_many :pets, PeoplePetsParty.Pet, join_through: "people_pets"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :location])
    |> validate_required([:name, :age, :location])
  end
end
