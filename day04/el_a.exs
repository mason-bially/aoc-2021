Code.require_file("el.ex", __DIR__)

File.stream!("day04/input", [encoding: :utf8], :line)
|> Stream.map(&String.trim/1)
|> Day04.parse_bingo
|> IO.inspect
