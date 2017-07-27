defmodule Movies.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :box_office, :integer
      add :budget, :integer
      add :name, :string

      timestamps()
    end

  end
end
