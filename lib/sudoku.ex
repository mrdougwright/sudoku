defmodule Sudoku do
  @moduledoc """
  Tests a sudoku grid to validate correct entries, including blanks ('.')
  """

  def valid_grid?(grid) do
    with true <- valid_rows?(grid),
         true <- valid_columns?(grid) do
      valid_sub_grids?(grid)
    end
  end

  def valid_rows?(grid) do
    Enum.all?(grid, &valid_list?(&1))
  end

  def valid_columns?(grid) do
    Enum.all?(0..8, &valid_column?(grid, &1))
  end

  def valid_column?(rows, index) do
    rows
    |> Enum.map(&Enum.at(&1, index))
    |> valid_list?()
  end

  def valid_sub_grids?(grid) do
    ranges = [0..2, 3..5, 6..8]

    grid
    |> Enum.chunk_every(3)
    |> Enum.all?(fn chunk ->
      Enum.all?(ranges, &valid_sub_grid?(chunk, &1))
    end)
  end

  defp valid_sub_grid?(three_rows, range) do
    three_rows
    |> Enum.flat_map(&Enum.slice(&1, range))
    |> valid_list?()
  end

  defp valid_list?(row) do
    valid_cells?(row) || valid_numbers?(row)
  end

  defp valid_cells?(row) do
    Enum.any?(row, &(&1 == '.'))
  end

  defp valid_numbers?(row) do
    row
    |> Enum.sort()
    |> List.flatten()
    |> case do
      '123456789' -> true
      _ -> false
    end
  end
end
