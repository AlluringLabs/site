defmodule Labs.Repo.Migrations.CreateContact do
  use Ecto.Migration

  def change do
    create table(:contact) do
      add :service, :string
      add :budget, :string
      add :projectinfo, :string
      add :fname, :string
      add :lname, :string
      add :email, :string
      add :phone, :string

      timestamps
    end

  end
end
