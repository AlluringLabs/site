# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Labs.Repo.insert!(%Labs.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Labs.User.create %{
  username: "g33kidd",
  first_name: "Joshua",
  last_name: "Kidd",
  bio: "Just a developer in a small world.",
  email_address: "kidd.josh.343@gmail.com",
  password: "passwrd",
  password_confirm: "passwrd"
}
