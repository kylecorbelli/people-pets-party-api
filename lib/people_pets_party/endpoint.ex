defmodule PeoplePetsParty.Endpoint do
  use Phoenix.Endpoint, otp_app: :people_pets_party

  socket "/socket", PeoplePetsParty.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :people_pets_party, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_people_pets_party_key",
    signing_salt: "5naYWT/l"

  plug Corsica, origins: [ "http://eminent-idea.surge.sh", "http://localhost:4200", "http://localhost:4000", "http://localhost:4300" ], allow_headers: [ "content-type" ]
  plug PeoplePetsParty.Router
end
