defmodule FridayWeb.PageControllerTest do
  use FridayWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "金曜日じゃない :("
  end

  test "GET /?country=", %{conn: conn} do
    conn = get(conn, "/?country=fr")
    assert html_response(conn, 200) =~ "Ce n&#39;est pas vendredi :("
  end
end
