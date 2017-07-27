defmodule Movies.Repo.Migrations.AddImageToMovies do
  use Ecto.Migration

  def change do
	alter table(:movies) do
      add :image_url, :string
    end
  end
end
