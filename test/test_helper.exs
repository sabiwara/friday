ExUnit.start()

Mox.defmock(Friday.MockClock, for: Friday.Clock)
Application.put_env(:friday, :clock, Friday.MockClock)
