defmodule Movies.Web.Movie do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movies.Web.Movie


  schema "movies" do
    field :box_office, :integer
    field :budget, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Movie{} = movie, attrs) do
    movie
    |> cast(attrs, [:box_office, :budget, :name])
    |> validate_required([:box_office, :budget, :name])
  end
end
