defmodule PeoplePetsParty.Repo.Migrations.AddImageToPets do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      add :image_url, :string
    end
  end
end

