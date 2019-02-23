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
    grid
    |> Enum.all?(&valid_list?(&1))
  end

  def valid_columns?(grid) do
    0..8
    |> Enum.with_index()
    |> Enum.all?(fn {index, _index} ->
      valid_column?(grid, index)
    end)
  end

  def valid_column?(rows, index) do
    rows
    |> Enum.map(fn row ->
      Enum.at(row, index)
    end)
    |> valid_list?()
  end

  def valid_sub_grids?(grid) do
    ranges = [0..2, 3..5, 6..8]

    grid
    |> Enum.chunk_every(3)
    |> Enum.all?(fn chunk ->
      ranges
      |> Enum.all?(fn range ->
        valid_sub_grid?(chunk, range)
      end)
    end)
  end

  defp valid_sub_grid?(three_rows, range) do
    three_rows
    |> Enum.flat_map(fn row ->
      Enum.slice(row, range)
      |> Enum.sort()
    end)
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
