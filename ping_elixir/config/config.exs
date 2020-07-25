# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ping_elixir, PingElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vrvRO+9vFV6qK9QCDKKEcPrKBacNLUwVC5D5V4Oq0zdH7KTUHUU9xX6Ybnd2yUhf",
  render_errors: [view: PingElixirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PingElixir.PubSub,
  live_view: [signing_salt: "lorRe6B8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
