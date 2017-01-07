defmodule PeoplePetsParty.PersonController do
  use PeoplePetsParty.Web, :controller

  alias PeoplePetsParty.Person

  def index(conn, _params) do
    people = Repo.all(Person)
    render(conn, "index.json-api", data: people)
  end

  def create(conn, %{"data" => %{"attributes" => person_params}}) do
    changeset = Person.changeset(%Person{}, person_params)

    case Repo.insert(changeset) do
      {:ok, person} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", person_path(conn, :show, person))
        |> render("show.json-api", data: person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PeoplePetsParty.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Person
             |> Repo.get(id)
             |> Repo.preload([ :pets ])
    case person do
      %Person{} -> render(conn, "show.json-api", data: person, opts: [ include: "pets" ])
      nil -> json(conn, %{ data: nil })
    end
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person, person_params)

    case Repo.update(changeset) do
      {:ok, person} ->
        render(conn, "show.json-api", data: person)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PeoplePetsParty.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(person)

    send_resp(conn, :no_content, "")
  end
end
