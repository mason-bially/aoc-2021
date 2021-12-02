Code.require_file("el.ex", __DIR__)

File.stream!("day02/input", [encoding: :utf8], :line)
|> Stream.map(&String.split(&1, " ", trim: true))
|> Enum.map(fn
  [cmd, x] -> [cmd, elem(Integer.parse(x), 0)]
end)
|> Stream.map(fn
  ["forward", x] -> [x, 0]
  ["down", x] -> [0, x]
  ["up", x] -> [0, -x]
end)
|> Enum.reduce([0, 0], fn [a_h, a_v], [b_h, b_v]->
    [a_h + b_h, a_v + b_v]
  end)
|> Kernel.then(fn [h, v] -> h * v end)
|> IO.inspect
