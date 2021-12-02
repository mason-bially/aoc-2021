Code.require_file("el.ex", __DIR__)

File.stream!("day02/input", [encoding: :utf8], :line)
|> Stream.map(&String.split(&1, " ", trim: true))
|> Enum.map(fn
  [cmd, x] -> {cmd, elem(Integer.parse(x), 0)}
end)
|> Stream.map(fn
  {"forward", x} -> {x, 0}
  {"down", x} -> {0, x}
  {"up", x} -> {0, -x}
end)
|> Enum.reduce({0, 0, 0}, fn {a_f, a_aim}, {r_h, r_d, r_a} ->
    {r_h + a_f, r_d + r_a * a_f, r_a + a_aim}
  end)
|> Kernel.then(fn {h, v, _a} -> h * v end)
|> IO.inspect
