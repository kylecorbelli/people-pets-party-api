defmodule PeoplePetsParty.PersonView do
  use PeoplePetsParty.Web, :view

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PeoplePetsParty.PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PeoplePetsParty.PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      name: person.name,
      age: person.age,
      location: person.location}
  end
end
