defmodule Sudoku do
  def valid_row?(row) do
    row
    |> Enum.any?(&(&1 == '.'))
    |> case do
      true -> true
      _ -> valid_row_of_nums?(row)
    end
  end

  defp valid_row_of_nums?(row) do
    row
    |> Enum.uniq()
    |> Enum.count()
    |> case do
      9 -> true
      _ -> false
    end
  end

  def valid_column?(rows) when length(rows) == 9 do
    true
  end

  def valid_column?(rows) do
    false
  end

  def valid_sub_grid?(rows) do
  end
end
