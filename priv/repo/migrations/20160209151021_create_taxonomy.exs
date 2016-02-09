defmodule Labs.Repo.Migrations.CreateTaxonomy do
  use Ecto.Migration

  def change do
    create table(:taxonomies) do
      add :name, :string
      add :type, :string
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps
    end
    create index(:taxonomies, [:post_id])

  end
end
