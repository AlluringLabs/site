defmodule Labs.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :first_name, :string
      add :last_name, :string
      add :email_address, :string
      add :bio, :string
      add :password_hash, :string

      timestamps
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email_address])
  end
end
