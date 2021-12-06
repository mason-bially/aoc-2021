Code.require_file("el.ex", __DIR__)

initial =
  File.stream!("day06/input", [encoding: :utf8], 1)
  |> Util.stream_comma_seperated
  |> Enum.map(&String.trim/1)
  |> Stream.map(&elem(Integer.parse(&1), 0))
  |> Enum.reduce(%{}, &Util.counter/2)

Enum.reduce(1..80, initial, fn _, acc -> Day06.simulate(acc) end)
|> Enum.map(fn {_, v} -> v end)
|> Enum.sum
|> IO.inspect #
