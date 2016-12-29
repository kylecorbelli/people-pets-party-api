defmodule PeoplePetsParty.Pet do
  use PeoplePetsParty.Web, :model

  schema "pets" do
    field :name, :string
    field :age, :integer
    field :type, :string
    many_to_many :people, PeoplePetsParty.Person, join_through: "people_pets"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :type])
    |> validate_required([:name, :age, :type])
  end
end