defmodule SudokuTest do
  use ExUnit.Case
  doctest Sudoku

  setup do
    grids()
  end

  test "valid_row?/1" do
    assert Sudoku.hello() == :world
  end
end

# Determine if a Sudoku is valid. The Sudoku board could be partially filled,
# where empty cells are filled with the character '.'.
# Given a grid, return true if it is valid, return false otherwise.
# The grid is valid when each row, each column and each 3x3 sub grid
# contains at most one occurrence of the numbers 1 to 9.

def grids do
  valid = [
    [
      ['.', '.', '.', '1', '4', '.', '.', '2', '.'],
      ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
      ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
      ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
      ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
      ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
      ['.', '.', '.', '5', '.', '.', '.', '7', '.']
    ],
    # Valid
    [
      ['1', '2', '3', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '7', '.', '.', '.', '.'],
      ['4', '5', '6', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['.', '.', '.', '.', '.', '.', '.', '.', '.']
    ],
    # Valid
    [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
      ['4', '5', '6', '7', '8', '9', '1', '2', '3'],
      ['7', '8', '9', '1', '2', '3', '4', '5', '6'],
      ['2', '3', '4', '5', '6', '7', '8', '9', '1'],
      ['5', '6', '7', '8', '9', '1', '2', '3', '4'],
      ['8', '9', '1', '2', '3', '4', '5', '6', '7'],
      ['3', '4', '5', '6', '7', '8', '9', '1', '2'],
      ['6', '7', '8', '9', '1', '2', '3', '4', '5'],
      ['9', '1', '2', '3', '4', '5', '6', '7', '8']
    ]
  ]

  invalid = [
    # Invalid
    [
      ['1', '2', '3', '4', '5', '6', '6', '8', '9'],
      ['4', '5', '6', '.', '.', '.', '.', '.', '.'],
      ['7', '8', '9', '.', '.', '.', '.', '.', '.'],
      ['2', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['5', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['8', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['3', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['6', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['9', '.', '.', '.', '.', '.', '.', '.', '.']
    ],
    # Invalid
    [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
      ['4', '5', '6', '.', '.', '.', '.', '.', '.'],
      ['7', '8', '9', '.', '.', '.', '.', '.', '.'],
      ['2', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['5', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['3', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['3', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['6', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['9', '.', '.', '.', '.', '.', '.', '.', '.']
    ],
    # Invalid
    [
      ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
      ['4', '5', '8', '.', '.', '.', '.', '.', '.'],
      ['7', '8', '9', '.', '.', '.', '.', '.', '.'],
      ['2', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['5', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['8', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['3', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['6', '.', '.', '.', '.', '.', '.', '.', '.'],
      ['9', '.', '.', '.', '.', '.', '.', '.', '.']
    ],
    # Invalid
    [
      ['1', '2', '8', '4', '5', '6', '7', '8', '9'],
      ['4', '7', '6', '7', '8', '9', '1', '2', '3'],
      ['7', '8', '9', '1', '2', '3', '4', '5', '6'],
      ['2', '3', '4', '5', '6', '7', '8', '9', '1'],
      ['5', '6', '7', '8', '9', '1', '2', '3', '4'],
      ['8', '9', '1', '2', '3', '4', '5', '6', '7'],
      ['3', '4', '5', '6', '7', '8', '9', '1', '2'],
      ['6', '7', '8', '9', '1', '2', '3', '4', '5'],
      ['9', '1', '2', '3', '4', '5', '6', '7', '8']
    ]
  ]

  %{valid: valid, invalid: invalid}
end
