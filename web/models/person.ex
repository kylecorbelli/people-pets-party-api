defmodule PeoplePetsParty.Person do
  use PeoplePetsParty.Web, :model

  schema "people" do
    field :name, :string
    field :age, :integer
    field :location, :string
    field :image_url, :string
    many_to_many :pets, PeoplePetsParty.Pet, join_through: "people_pets", on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :age, :location, :image_url])
    |> validate_required([:name, :age, :location])
  end
end
