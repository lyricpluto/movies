defmodule Movies.People.Actor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movies.People.Actor


  schema "actors" do
    field :name, :string
    field :net_worth, :integer
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(%Actor{} = actor, attrs) do
    actor
    |> cast(attrs, [:name, :surname, :net_worth])
    |> validate_required([:name, :surname, :net_worth])
  end
end
