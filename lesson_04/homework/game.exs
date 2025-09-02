defmodule Game do

  def join_game({:user, name, age, role}) do
    cond do
      role == :admin or role == :moderator -> :ok
      age > 18 -> :ok
      true -> :error
    end
  end

  def move_allowed?(current_color, {type, color}) do
    (type == :pawn or type == :rock) and current_color == color
  end

  def single_win?(a_win, b_win) do
    a_win != b_win
  end

  def double_win?(a_win, b_win, c_win) do
    cond do
      a_win && b_win && c_win -> false
      a_win && b_win -> :ab
      a_win && c_win -> :ac
      b_win && c_win -> :bc
      true -> false
    end
  end

end
