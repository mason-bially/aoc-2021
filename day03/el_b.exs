Code.require_file("el.ex", __DIR__)

File.stream!("day03/input", [encoding: :utf8], :line)
|> Stream.map(&String.trim/1)
|> Stream.filter(fn l -> l != "" end)
|> Enum.map(&String.to_charlist/1)
|> Kernel.then(fn n ->
  {
    Day03.eliminate_to_last_number(n,
      fn c, {c0, c1} -> if c0 > c1, do: c == ?0, else: c == ?1 end)
    |> Day03.to_number_cl,

    Day03.eliminate_to_last_number(n,
      fn c, {c0, c1} -> if c1 < c0, do: c == ?1, else: c == ?0 end)
    |> Day03.to_number_cl,
  }
end)
|> Kernel.then(fn {co2, oxy} -> co2 * oxy end)
|> IO.inspect
