defmodule Friday.Context do
  alias Friday.Clock

  @type country :: :jp | :fr
  @friday 5

  @spec describe_today(country()) :: String.t()
  def describe_today(country) do
    timezone = get_timezone(country)

    Clock.utc_now()
    |> DateTime.shift_zone!(timezone)
    |> DateTime.to_date()
    |> Date.day_of_week()
    |> get_message(country)
  end

  defp get_timezone(:jp), do: "Asia/Tokyo"
  defp get_timezone(:fr), do: "Europe/Paris"

  defp get_message(@friday, :jp), do: "金曜じゃ！"
  defp get_message(_day, :jp), do: "金曜日じゃない :("

  defp get_message(@friday, :fr), do: "C'est vendredi !"
  defp get_message(_day, :fr), do: "Ce n'est pas vendredi :("

  def validate_country("jp"), do: {:ok, :jp}
  def validate_country("fr"), do: {:ok, :fr}
  def validate_country(_), do: :error
end
