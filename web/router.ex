defmodule PeoplePetsParty.Router do
  use PeoplePetsParty.Web, :router

  pipeline :api do
    plug :accepts, [ "json", "json-api" ]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", PeoplePetsParty do
    pipe_through :api

    resources "/people", PersonController, except: [ :new, :edit ]
    resources "/pets", PetController, except: [ :new, :edit ]
    resources "/person-pets-connection", PersonPetsConnectionController, only: [ :create, :delete ]
  end
end
