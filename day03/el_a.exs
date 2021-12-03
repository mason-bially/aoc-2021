Code.require_file("el.ex", __DIR__)

File.stream!("day03/input", [encoding: :utf8], :line)
|> Stream.map(&String.trim/1)
|> Stream.filter(fn l -> l != "" end)
|> Enum.map(&String.to_charlist/1)
|> Day03.transpose
|> Enum.map(fn s -> Enum.reduce(s, {0, 0}, &Day03.counts/2) end)
|> Day03.to_numbers
|> Kernel.then(fn {g, e} -> g * e end)
|> IO.inspect
