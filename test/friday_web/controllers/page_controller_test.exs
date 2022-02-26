defmodule FridayWeb.PageControllerTest do
  use FridayWeb.ConnCase

  import Mock

  test "GET / (non-friday)", %{conn: conn} do
    with_mock Date, day_of_week: fn _ -> 4 end do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "金曜日じゃない :("
    end
  end

  test "GET / (friday)", %{conn: conn} do
    with_mock Date, day_of_week: fn _ -> 5 end do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "金曜じゃ！"
    end
  end

  test "GET /?country=", %{conn: conn} do
    with_mock Date, day_of_week: fn _ -> 4 end do
      conn = get(conn, "/?country=fr")
      assert html_response(conn, 200) =~ "Ce n&#39;est pas vendredi :("
    end
  end
end
