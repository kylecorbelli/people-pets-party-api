defmodule PeoplePetsParty.Repo.Migrations.AddPeoplePetsJunctionTable do
  use Ecto.Migration

  def change do
    create table(:people_pets, primary_key: false) do
      add :person_id, references(:people)
      add :pet_id, references(:pets)
    end
  end
end

