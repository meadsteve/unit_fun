defmodule UnitFun.Units.UnitSimplifier do
  @moduledoc false

  alias UnitFun.Units.CompositeUnit

  def simplify_unit(%UnitFun.Value{value: value, units: units}) do
    %UnitFun.Value{value: value, units: simplify_unit(units)}
      |> try_flatten
  end

  def simplify_unit(unit) do
    unit
      |> cancel_out
      |> try_flatten
  end

  defp cancel_out(%CompositeUnit{} = unit) do
    denominators = unit.denominators
      |> count_up_unit_list
      |> negate_all
    unit.numerators
      |> count_up_unit_list
      |> combine_with(denominators)
      |> as_type
      |> CompositeUnit.standardise
  end
  defp cancel_out(type), do: type

  defp try_flatten(%CompositeUnit{numerators: [single_unit], denominators: []}) do
    single_unit
  end

  defp try_flatten(%UnitFun.Value{
    value: plain_value,
    units: %CompositeUnit{numerators: [], denominators: []}})
  do
    plain_value
  end

  defp try_flatten(x), do: x

  defp count_up_unit_list(thing) do
    thing
      |> Enum.group_by(fn t ->
        t.__struct__
      end)
      |> Enum.map(fn {type, dupes} -> {type, Enum.count(dupes)} end)
  end

  defp combine_with(numerators, denominators) do
    numerators
      |> Enum.concat(denominators)
      |> Enum.group_by(fn {type, _count} -> type end)
      |> Enum.map(fn {type, pairs} -> {type, sum_pairs(pairs)} end)
  end

  defp as_type(type_and_counts) do
    numerators = type_and_counts
      |> Enum.filter(fn {_type, count} -> count > 0 end)
      |> Enum.flat_map(fn {type, count} -> repeated(type.unit, count) end)
    denominators = type_and_counts
      |> Enum.filter(fn {_type, count} -> count < 0 end)
      |> Enum.flat_map(fn {type, count} -> repeated(type.unit, -count) end)
    %CompositeUnit{numerators: numerators, denominators: denominators}
  end

  defp repeated(type, count),    do: repeated(type, count, [])
  defp repeated(_type, 0, list), do: list
  defp repeated(type, n, list),  do: repeated(type, n - 1, [type | list])

  defp negate_all(counted_types)  do
    counted_types
      |> Enum.map(fn {type, count} -> {type, -count} end)
  end

  defp sum_pairs(possible_pairs) do
    possible_pairs
      |> Enum.map(fn {_type, count} -> count end)
      |> Enum.sum
  end

end
