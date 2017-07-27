defmodule Movies.PeopleTest do
  use Movies.DataCase

  alias Movies.People

  describe "actors" do
    alias Movies.People.Actor

    @valid_attrs %{name: "some name", net_worth: 42, surname: "some surname"}
    @update_attrs %{name: "some updated name", net_worth: 43, surname: "some updated surname"}
    @invalid_attrs %{name: nil, net_worth: nil, surname: nil}

    def actor_fixture(attrs \\ %{}) do
      {:ok, actor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> People.create_actor()

      actor
    end

    test "list_actors/0 returns all actors" do
      actor = actor_fixture()
      assert People.list_actors() == [actor]
    end

    test "get_actor!/1 returns the actor with given id" do
      actor = actor_fixture()
      assert People.get_actor!(actor.id) == actor
    end

    test "create_actor/1 with valid data creates a actor" do
      assert {:ok, %Actor{} = actor} = People.create_actor(@valid_attrs)
      assert actor.name == "some name"
      assert actor.net_worth == 42
      assert actor.surname == "some surname"
    end

    test "create_actor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_actor(@invalid_attrs)
    end

    test "update_actor/2 with valid data updates the actor" do
      actor = actor_fixture()
      assert {:ok, actor} = People.update_actor(actor, @update_attrs)
      assert %Actor{} = actor
      assert actor.name == "some updated name"
      assert actor.net_worth == 43
      assert actor.surname == "some updated surname"
    end

    test "update_actor/2 with invalid data returns error changeset" do
      actor = actor_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_actor(actor, @invalid_attrs)
      assert actor == People.get_actor!(actor.id)
    end

    test "delete_actor/1 deletes the actor" do
      actor = actor_fixture()
      assert {:ok, %Actor{}} = People.delete_actor(actor)
      assert_raise Ecto.NoResultsError, fn -> People.get_actor!(actor.id) end
    end

    test "change_actor/1 returns a actor changeset" do
      actor = actor_fixture()
      assert %Ecto.Changeset{} = People.change_actor(actor)
    end
  end
end
