defmodule Movies.Repo.Migrations.AddMovieActors do
  use Ecto.Migration

   def change do
    create table(:movie_actors) do
      add :movie_id, :integer
      add :actor_id, :integer

      timestamps()

    end
  end
end
