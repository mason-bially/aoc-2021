Code.require_file("el.ex", __DIR__)

File.stream!("day05/input", [encoding: :utf8], :line)
|> Enum.map(&Day05.parse_line/1)
|> Stream.filter(fn {{ax, ay}, {bx, by}} -> (ax == bx) || (ay == by) end)
|> Enum.reduce(%{}, &Day05.draw_line/2)
|> Enum.filter(fn {_, c} -> c >= 2 end)
|> Enum.count
|> IO.inspect # 3990
