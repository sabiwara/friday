defmodule Friday.Context do
  @type country :: :jp | :fr
  @friday 5

  @doc """

  ## Examples

      iex> describe_today(:jp, ~U[2022-02-24 12:01:01Z])
      "金曜日じゃない :("

      iex> describe_today(:jp, ~U[2022-02-24 16:01:01Z])
      "金曜じゃ！"

      iex> describe_today(:fr, ~U[2022-02-24 16:01:01Z])
      "Ce n'est pas vendredi :("

      iex> describe_today(:fr, ~U[2022-02-24 23:01:01Z])
      "C'est vendredi !"

  """
  @spec describe_today(country(), DateTime.t()) :: String.t()
  def describe_today(country, utc_now \\ DateTime.utc_now()) do
    timezone = get_timezone(country)

    utc_now
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
