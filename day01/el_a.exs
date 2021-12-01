Code.require_file("el.ex", __DIR__)

File.stream!("day01/input", [encoding: :utf8], :line)
|> Stream.map(&elem(Integer.parse(&1), 0))
|> Enum.chunk_every(2, 1, :discard)
|> Stream.map(fn
    [a, b] when b > a -> 1
    _ -> 0
  end)
|> Enum.sum()
|> IO.inspect
