# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tconchie_backend,
  ecto_repos: [TconchieBackend.Repo]

# Configures the endpoint
config :tconchie_backend, TconchieBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T/iDqN7qrfH+K3xZMTXC/aVup0ZeUo6Z0jdmhLnqdkhlxEOIbReJrYl7WcXuUaOW",
  render_errors: [view: TconchieBackendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TconchieBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
