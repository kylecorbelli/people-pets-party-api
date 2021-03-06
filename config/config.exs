# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :phoenix, :format_encoders, "json-api": Poison
config :plug, :mimes, %{
  "application/vnd.api+json" => [ "json-api" ]
}

# General application configuration
config :people_pets_party,
  ecto_repos: [PeoplePetsParty.Repo]

# Configures the endpoint
config :people_pets_party, PeoplePetsParty.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "95V/wSg9KAzXmqPlkEf5bXf+ecbjW711kyV968B+JHMXl22KrRUcaPh1LO85ZoYG",
  render_errors: [view: PeoplePetsParty.ErrorView, accepts: ~w(json)],
  pubsub: [name: PeoplePetsParty.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
