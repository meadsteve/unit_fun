defmodule UnitFun do
  alias UnitFun.Value
  alias UnitFun.Convertor

  def add(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    %Value{value: left + right, units: x}
  end

  def add(%Value{units: left_units} = left_side, right_side) do
    updated_right_side = right_side |> convert_to(left_units)
    add(left_side, updated_right_side)
  end

  def subtract(left, %Value{value: right, units: units}) do
    add(left, %Value{value: -right, units: units})
  end

  defp convert_to(%{units: units, value: value}, to_units) do
    Convertor.convert(to_units, units.__struct__, value)
  end

end
