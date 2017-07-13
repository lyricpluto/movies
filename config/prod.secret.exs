use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :movies, Movies.Endpoint,
  secret_key_base: "SuM3iJfKiMDFnqUREAh44jqD5luQVvSXP3OsyaMTYdL2hpeYIO/0y1aXVA/tflIU"

# Configure your database
config :movies, Movies.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "movies_prod",
  pool_size: 20
