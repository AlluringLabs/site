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

Labs.Repo.insert! %Labs.Post{
  title: "Some Long Article Title",
  category: "Programming",
  body: "Lorem ipsum dolo sit amet, consectetur adipiscing elit. Phasellus ac suscipit enim, a finibus nisl. Maecenas at mollis risus. Suspendisse potenti. Curabitur pellentesque ullamcorper est sed convallis. Nulla facilisis nisl arcu, sit amet scelerisque dui condimentum quis.",
  slug: "some-article",
  user_id: 1
}

Labs.Repo.insert! %Labs.Post{
  title: "Some Long Article Title",
  category: "Programming",
  body: "Lorem ipsum dolo sit amet, consectetur adipiscing elit. Phasellus ac suscipit enim, a finibus nisl. Maecenas at mollis risus. Suspendisse potenti. Curabitur pellentesque ullamcorper est sed convallis. Nulla facilisis nisl arcu, sit amet scelerisque dui condimentum quis.",
  slug: "just-an-article",
  user_id: 1
}

Labs.Repo.insert! %Labs.Post{
  title: "Some Long Article Title",
  category: "Programming",
  body: "Lorem ipsum dolo sit amet, consectetur adipiscing elit. Phasellus ac suscipit enim, a finibus nisl. Maecenas at mollis risus. Suspendisse potenti. Curabitur pellentesque ullamcorper est sed convallis. Nulla facilisis nisl arcu, sit amet scelerisque dui condimentum quis.",
  slug: "another-article",
  user_id: 1
}

post = Labs.Repo.insert! %Labs.Post{
  title: "Some Long Article Title",
  category: "Programming",
  body: "Lorem ipsum dolo sit amet, consectetur adipiscing elit. Phasellus ac suscipit enim, a finibus nisl. Maecenas at mollis risus. Suspendisse potenti. Curabitur pellentesque ullamcorper est sed convallis. Nulla facilisis nisl arcu, sit amet scelerisque dui condimentum quis.",
  slug: "just-article",
  user_id: 1
}

Labs.Repo.insert! %Labs.Taxonomy{
  name: "Programming",
  type: "category",
  post_id: post.id
}
