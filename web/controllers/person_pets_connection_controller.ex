require Ecto.Query

defmodule PeoplePetsParty.PersonPetsConnectionController do
  use PeoplePetsParty.Web, :controller

  alias PeoplePetsParty.PersonPet
  alias PeoplePetsParty.Person

  def create(conn, %{"data" => %{"attributes" => person_pets_connection_params}}) do
    person_id = person_pets_connection_params["person_id"]
    pet_ids = person_pets_connection_params["pet_ids"]

    Enum.each pet_ids, fn pet_id ->
      %PersonPet{ person_id: person_id, pet_id: pet_id}
      |> PersonPet.changeset
      |> Repo.insert
    end

    person = Person
             |> Repo.get(person_id)
             |> Repo.preload(:pets)

    conn
    |> put_status(:created)
    |> render("show.json-api", data: person, opts: [ include: "pets" ])
  end

  # def delete(conn, %{"id" => id}) do
  #   person_pets_connection = Repo.get!(PersonPetsConnection, id)

  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(person_pets_connection)

  #   send_resp(conn, :no_content, "")
  # end
end
