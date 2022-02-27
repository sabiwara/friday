defmodule Friday.Clock do
  @callback utc_now :: DateTime.t()

  def utc_now do
    clock_module().utc_now()
  end

  defp clock_module do
    Application.get_env(:friday, :clock, DateTime)
  end
end
