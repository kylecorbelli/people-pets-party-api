defmodule PeoplePetsParty.Router do
  use PeoplePetsParty.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PeoplePetsParty do
    pipe_through :api
  end
end
