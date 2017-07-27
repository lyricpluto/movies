defmodule Movies.Repo.Migrations.CreateActors do
  use Ecto.Migration

  def change do
    create table(:actors) do
      add :name, :string
      add :surname, :string
      add :net_worth, :integer

      timestamps()
    end

  end
end
