defmodule Movies.PageController do
  use Movies.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def actors(conn, _params) do
    render conn, "actors.html"
  end
end
