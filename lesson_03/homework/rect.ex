defmodule Rect do

  def intersect(
        {:rect, left_top_1, right_bottom_1} = rect1,
        {:rect, left_top_2, right_bottom_2} = rect2
      ) do

    unless valid_rect(rect1), do: raise "invalid rect 1"  
    unless valid_rect(rect2), do: raise "invalid rect 2"

    {:point, x1_1, y1_1} = left_top_1
    {:point, x2_1, y2_1} = right_bottom_1
    {:point, x1_2, y1_2} = left_top_2
    {:point, x2_2, y2_2} = right_bottom_2

    not (x2_1 <= x1_2 or x2_2 <= x1_1 or y1_1 <= y2_2 or y1_2 <= y2_1)

  end

  #  x1 < x2 and y1 > y2
  def valid_rect({:rect, left_top, right_bottom}) do
    {:point, x1, y1} = left_top
    {:point, x2, y2} = right_bottom

    x1 < x2 and y1 > y2
  end

end
