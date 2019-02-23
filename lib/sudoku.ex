defmodule Sudoku do
  def valid_row?(row) do
    row
    |> valid_row_count?()
  end

  def valid_column?(rows, index) do
    rows
    |> Enum.map(fn row ->
      Enum.at(row, index)
    end)
    |> valid_row_count?()
  end

  defp valid_row_count?(row) do
    case Enum.any?(row, &(&1 == '.')) do
      true -> true
      false -> valid_cell_count?(row)
    end
  end

  defp valid_cell_count?(row) do
    row
    |> Enum.uniq()
    |> Enum.count()
    |> case do
      9 -> true
      _ -> false
    end
  end

  def valid_sub_grid?(rows) do
  end
end
