defmodule TicTacToe do

  @type cell :: :x | :o | :f
  @type row :: {cell, cell, cell}
  @type game_state :: {row, row, row}
  @type game_result :: {:win, :x} | {:win, :o} | :no_win

  @spec valid_game?(game_state) :: boolean

  @valid_cells [:x, :o, :f]
  def valid_game?({{a, b, c}, {d, e, f}, {g, h, i}}) do
    Enum.all?([a, b, c, d, e, f, g, h, i], &(&1 in @valid_cells))
  end
  def valid_game?(_), do: false

  @spec check_who_win(game_state) :: game_result
  def check_who_win(state) do
    lines(state)
    |> Enum.find_value(:no_win, fn row ->
    case all_same(row) do
      {:ok, cell} -> {:win, cell}
      false -> nil
    end
   end)
  end

  defp all_same({a, a, a}) when a != :f, do: {:ok, a}
  defp all_same(_), do: false

  defp lines({r1, r2, r3}) do
    [
      r1, r2, r3,

      {elem(r1, 0), elem(r2, 0), elem(r3, 0)},
      {elem(r1, 1), elem(r2, 1), elem(r3, 1)},
      {elem(r1, 2), elem(r2, 2), elem(r3, 2)},

      {elem(r1, 0), elem(r2, 1), elem(r3, 2)},
      {elem(r1, 2), elem(r2, 1), elem(r3, 0)}
    ]
  end
end
