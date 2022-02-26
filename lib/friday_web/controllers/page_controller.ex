defmodule FridayWeb.PageController do
  use FridayWeb, :controller

  alias Friday.Context

  def index(conn, params) do
    {:ok, country} =
      params
      |> Map.get("country", "jp")
      |> Context.validate_country()

    message = Context.describe_today(country)

    conn
    |> assign(:message, message)
    |> render("index.html")
  end
end
