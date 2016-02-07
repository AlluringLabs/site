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

Labs.Repo.insert! %Labs.Post{
  title: "Some Long Article Title",
  category: "Programming",
  body: "Some fucking ## Markdown content",
  slug: "some-long-article-title",
  user_id: 1
}
