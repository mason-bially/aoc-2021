Code.require_file("el.ex", __DIR__)

File.stream!("day02/input", [encoding: :utf8], :line)
|> Stream.map(&String.split(&1, " ", trim: true))
|> Stream.map(&Day02.parse_line/1)
|> Stream.map(&Day02.parse_commands/1)
|> Enum.reduce({0, 0, 0}, &Day02.calc/2)
|> Kernel.then(fn {h, v, _a} -> h * v end)
|> IO.inspect
