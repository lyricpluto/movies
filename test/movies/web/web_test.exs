defmodule Movies.WebTest do
  use Movies.DataCase

  alias Movies.Web

  describe "movies" do
    alias Movies.Web.Movie

    @valid_attrs %{"": "some ", "box_office,": "some box_office,", "budget,": "some budget,", "name,": "some name,"}
    @update_attrs %{"": "some updated ", "box_office,": "some updated box_office,", "budget,": "some updated budget,", "name,": "some updated name,"}
    @invalid_attrs %{"": nil, "box_office,": nil, "budget,": nil, "name,": nil}

    def movie_fixture(attrs \\ %{}) do
      {:ok, movie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Web.create_movie()

      movie
    end

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Web.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Web.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      assert {:ok, %Movie{} = movie} = Web.create_movie(@valid_attrs)
      assert movie. == "some "
      assert movie.box_office, == "some box_office,"
      assert movie.budget, == "some budget,"
      assert movie.name, == "some name,"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      assert {:ok, movie} = Web.update_movie(movie, @update_attrs)
      assert %Movie{} = movie
      assert movie. == "some updated "
      assert movie.box_office, == "some updated box_office,"
      assert movie.budget, == "some updated budget,"
      assert movie.name, == "some updated name,"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_movie(movie, @invalid_attrs)
      assert movie == Web.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Web.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Web.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Web.change_movie(movie)
    end
  end

  describe "movies" do
    alias Movies.Web.Movie

    @valid_attrs %{box_office: 42, budget: 42, name: "some name"}
    @update_attrs %{box_office: 43, budget: 43, name: "some updated name"}
    @invalid_attrs %{box_office: nil, budget: nil, name: nil}

    def movie_fixture(attrs \\ %{}) do
      {:ok, movie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Web.create_movie()

      movie
    end

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Web.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Web.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      assert {:ok, %Movie{} = movie} = Web.create_movie(@valid_attrs)
      assert movie.box_office == 42
      assert movie.budget == 42
      assert movie.name == "some name"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      assert {:ok, movie} = Web.update_movie(movie, @update_attrs)
      assert %Movie{} = movie
      assert movie.box_office == 43
      assert movie.budget == 43
      assert movie.name == "some updated name"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_movie(movie, @invalid_attrs)
      assert movie == Web.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Web.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Web.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Web.change_movie(movie)
    end
  end
end
