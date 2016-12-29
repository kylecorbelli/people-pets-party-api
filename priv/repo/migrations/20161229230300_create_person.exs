defmodule PeoplePetsParty.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer
      add :location, :string

      timestamps()
    end

  end
end
