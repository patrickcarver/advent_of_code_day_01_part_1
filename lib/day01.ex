defmodule Day01 do
  def start do
    get_input()
    |> copy_first_to_last()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)    
    |> process([])

  end

  defp get_input do
    "../assets/input.txt"
    |> Path.expand(__DIR__)
    |> File.read!    
  end

  defp copy_first_to_last(input) do
    first = String.first(input)
    input <> first
  end

  defp process(input_list, output_list) when length(input_list) == 1 do
    Enum.reduce(output_list, fn(elem, acc) -> elem + acc end)
  end

  defp process(input_list, output_list) do
    [first | rest] = input_list
    [second | _ ] = rest

    if first == second do
      process(rest, [first | output_list])
    else
      process(rest, output_list)
    end
  end
end
