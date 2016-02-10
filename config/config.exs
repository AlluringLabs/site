# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :labs, Labs.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "KOWrq8tzYSApa4cxuTS0p1sknmRz1YVl8hL6DYnEfpWdkEbypyxvFdeUeLwEulel",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Labs.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Mailgun Configuration
config :labs,
  mailgun_domain: "https://api.mailgun.net/v3/alluringlabs.com",
  mailgun_key: "key-a88bc5d337d955fc12a0b663fa3e4cb2"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
