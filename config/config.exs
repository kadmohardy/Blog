# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog,
  ecto_repos: [Blog.Repo]

# Configures the endpoint
config :blog, BlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hAaYxEjtlpJRcVtIhn533DWVu9EXHDHNEV1U5AJADFVR9AfMyH54n9aG7c8mE+Pu",
  render_errors: [view: BlogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Blog.PubSub,
  live_view: [signing_salt: "15h7gJG+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use for Google Auth
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# client_id: "937785463454-2ics1ujoiht6in24n6u58i2bpbnufvi5.apps.googleusercontent.com",
# client_secret: "si1PErMf5VoR5QuU7kWjVzaV"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
