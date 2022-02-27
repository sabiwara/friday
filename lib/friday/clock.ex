defmodule Friday.Clock do
  @callback utc_now :: DateTime.t()

  @clock_module Application.compile_env(:friday, :clock, DateTime)

  def utc_now do
    @clock_module.utc_now()
  end
end
