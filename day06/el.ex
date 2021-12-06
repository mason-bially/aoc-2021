Code.require_file("../util/util.ex", __DIR__)

defmodule Day06 do
  def simulate(state) do
    Enum.map(state, fn {k, v} ->
      case k do
        0 -> [{6, v}, {8, v}]
        k -> [{k - 1, v}]
      end
    end)
    |> List.flatten
    |> Enum.reduce(%{},
      fn {k, v}, acc -> Map.update(acc, k, v, &(&1 + v)) end
    )
  end
end
