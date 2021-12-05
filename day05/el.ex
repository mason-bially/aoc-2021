Code.require_file("../util/util.ex", __DIR__)

defmodule Day05 do
  def parse_line(line) do
    [a, _, b] = String.split(String.trim(line), " ", trim: true)
    [ax, ay] = String.split(a, ",", trim: true)
    [bx, by] = String.split(b, ",", trim: true)

    {
      {elem(Integer.parse(ax), 0), elem(Integer.parse(ay), 0)},
      {elem(Integer.parse(bx), 0), elem(Integer.parse(by), 0)}
    }
  end

  def draw_line({{ax, ay}, {bx, by}} = _line, map) do
    cond do
      ax == bx -> min(ay, by)..max(ay, by) |> Enum.map(&({ax, &1}))
      ay == by -> min(ax, bx)..max(ax, bx) |> Enum.map(&({&1, ay}))
      true -> Enum.zip(ax..bx, ay..by)
    end
    |> Enum.reduce(map, fn p, a -> Map.update(a, p, 1, &(&1 + 1)) end)
  end
end
