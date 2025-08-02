defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      legacy? ->
        cond do
          level == 0 -> :unknown
          level == 5 -> :unknown
          level == 1 -> :debug
          level == 2 -> :info
          level == 3 -> :warning
          level == 4 -> :error
          true -> :unknown
        end
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    alert_level = to_label(level, legacy?)

    cond do
      legacy? ->
        cond do
          alert_level == :error -> :ops
          alert_level == :fatal -> :ops
          alert_level == :unknown -> :dev1
          true -> false
        end
      alert_level == :error -> :ops
      alert_level == :fatal -> :ops
      alert_level == :unknown -> :dev2
      true -> false
    end
  end
end
