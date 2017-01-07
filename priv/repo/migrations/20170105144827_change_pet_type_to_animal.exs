defmodule PeoplePetsParty.Repo.Migrations.ChangePetTypeToAnimal do
  use Ecto.Migration

  def change do
    rename table(:pets), :type, to: :animal
  end
end
