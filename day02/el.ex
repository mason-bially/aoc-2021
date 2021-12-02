Code.require_file("../util/util.ex", __DIR__)

defmodule Day02 do
  def parse_line([cmd, x] = _line) do
    {cmd, elem(Integer.parse(x), 0)}
  end

  def parse_commands(cmd) do
    case cmd do
      {"forward", x} -> {x, 0}
      {"down", x} -> {0, x}
      {"up", x} -> {0, -x}
    end
  end

  def calc({cmd_h, cmd_a} = _cmd, {s_h, s_d, s_a} = _acc) do
    {
      s_h + cmd_h, # horizonal
      s_d + s_a * cmd_h, # depth
      s_a + cmd_a # aim
    }
  end

  def calc({cmd_h, cmd_d} = _cmd, {s_h, s_d} = _acc) do
    {
      s_h + cmd_h, # horizonal
      s_d + cmd_d, # depth
    }
  end
end
