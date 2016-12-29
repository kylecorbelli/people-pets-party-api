defmodule PeoplePetsParty.Repo.Migrations.AddImageToPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :image_url, :string
    end
  end
end

