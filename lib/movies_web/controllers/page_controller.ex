defmodule MoviesWeb.PageController do
  use MoviesWeb, :controller

  alias Movies.Web

  def index(conn, _params) do
	movies = Web.list_movies()
    render(conn, "index.html", movies: movies)
  end
end
