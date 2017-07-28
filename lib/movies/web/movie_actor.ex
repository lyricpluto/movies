defmodule Movies.Web.MovieActor do
  use Ecto.Schema
  import Ecto.Changeset

  alias Movies.Web.MovieActor

  schema "movie_actors" do
    belongs_to :movie, Movies.Web.Movie
    belongs_to :actor, Movies.People.Actor

    timestamps()
  end

  @doc false
  def changeset(%MovieActor{} = movie_actor, attrs) do
    movie_actor
    |> cast(attrs, [:movie_id, :actor_id])
    |> validate_required([:movie_id, :actor_id])
  end
end
