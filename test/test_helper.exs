ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Labs.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Labs.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Labs.Repo)

