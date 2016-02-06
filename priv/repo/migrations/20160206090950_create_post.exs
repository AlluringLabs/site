defmodule Labs.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :tags, :map
      add :category, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:posts, [:user_id])

  end
end
