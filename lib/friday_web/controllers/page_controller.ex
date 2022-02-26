defmodule FridayWeb.PageController do
  use FridayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
