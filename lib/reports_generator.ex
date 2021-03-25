defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(file_name) do
    file_name
    |>Parser.parse_file()
    |>Enum.reduce(report_acc(), fn [id, food_name, price], report ->
      Map.put(report, id, report[id] + price)
    end)
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
end
