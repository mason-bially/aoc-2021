Code.require_file("../util/util.ex", __DIR__)

defmodule Day03 do
  def parse_line(line) do
    String.to_charlist(line)
  end

  def parse_commands(cmd) do
    case cmd do
      {"forward", x} -> {x, 0}
      {"down", x} -> {0, x}
      {"up", x} -> {0, -x}
    end
  end

  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def counts(elem, {c0, c1} = _acc) do
    case elem do
      ?1 -> {c0, c1 + 1}
      ?0 -> {c0 + 1, c1}
    end
  end

  def pad_leading_zeros(bs) when is_binary(bs), do: bs
  def pad_leading_zeros(bs) when is_bitstring(bs) do
    pad_length = 8 - rem(bit_size(bs), 8)
    <<0::size(pad_length), bs::bitstring>>
  end

  def to_number_bs(x) do
    x |> pad_leading_zeros |> :binary.decode_unsigned
  end

  def to_number_cl(x) do
    to_number_bs(Enum.into(x, <<>>, fn b -> <<(case b do ?1 -> 1; ?0 -> 0 end) :: 1>> end))
  end

  def to_numbers(counts) do
    {
      to_number_bs(Enum.into(counts, <<>>, fn {c0, c1} -> <<(if c0 > c1, do: 0, else: 1) :: 1>> end)),
      to_number_bs(Enum.into(counts, <<>>, fn {c0, c1} -> <<(if c0 < c1, do: 0, else: 1) :: 1>> end))
    }
  end

  def eliminate_to_last_number(n_list, filterfn) do
    Enum.reduce_while(0..100, n_list,
      fn i, list ->
        counts = Enum.reduce(Day03.transpose(list) |> Enum.at(i), {0, 0}, &Day03.counts/2)
        next_l = Enum.filter(list, fn e -> filterfn.(Enum.at(e, i), counts) end)
        case next_l do
          [] -> {:halt, List.last(list)}
          [x] -> {:halt, x}
          _ -> {:cont, next_l}
        end
      end)
  end
end
