defmodule FridayWeb.PageControllerTest do
  use FridayWeb.ConnCase, async: true

  import Mox

  @not_friday ~U[2022-02-24 12:01:01Z]
  @friday ~U[2022-02-24 16:01:01Z]

  setup :verify_on_exit!

  test "GET / (not friday)", %{conn: conn} do
    expect(Friday.MockClock, :utc_now, fn -> @not_friday end)

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "金曜日じゃない :("
  end

  test "GET / (friday)", %{conn: conn} do
    expect(Friday.MockClock, :utc_now, fn -> @friday end)

    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "金曜じゃ！"
  end

  test "GET /?country=", %{conn: conn} do
    expect(Friday.MockClock, :utc_now, fn -> @not_friday end)

    conn = get(conn, "/?country=fr")
    assert html_response(conn, 200) =~ "Ce n&#39;est pas vendredi :("
  end
end
