defmodule QuadraticEquation do
  @moduledoc """
  https://en.wikipedia.org/wiki/Quadratic_equation
  """

  @doc """
  function accepts 3 integer arguments and returns:
  {:roots, root_1, root_2} or {:root, root_1} or :no_root

  ## Examples
  iex> QuadraticEquation.solve(1, -2, -3)
  {:roots, 3.0, -1.0}
  iex> QuadraticEquation.solve(3, 5, 10)
  :no_roots
  """

  defp roots(d, a, b) do
    r1 = (-b + :math.sqrt(d)) / (2*a)
    r2 = (-b - :math.sqrt(d)) / (2*a)
    {:roots, r1, r2}
  end

  defp root(a, b) do
    {:root, -b / (2 * a)}  
  end

  def solve(a, b, c) do
    case b * b - 4 * a * c do
      d when d > 0 -> roots(d, a, b)
      d when d == 0 -> root(a, b)
      d when d < 0 -> :no_roots
    end
  end
end
