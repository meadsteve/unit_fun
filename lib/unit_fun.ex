defmodule UnitFun do
  alias UnitFun.Value
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

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

end
