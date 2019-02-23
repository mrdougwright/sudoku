defmodule Sudoku do
  def valid_rows?(rows) do
    rows
    |> Enum.all?(&valid_row_count?(&1))
  end

  def valid_column?(rows, index) do
    rows
    |> Enum.map(fn row ->
      Enum.at(row, index)
    end)
    |> valid_row_count?()
  end

  def valid_sub_grid?(grid) do
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
end
