defmodule UnitFun.Components.Divide do
  alias UnitFun.Value
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  def divide(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    left / right
  end

  def divide(%Value{units: left_units} = left, %Value{} = right) do
    updated_right = right |> convert_to(left_units)
    divide(left, updated_right)
  end

  def divide(%Value{value: left, units: units}, scalar_right) do
    %Value{value: left / scalar_right, units: units}
  end

  def divide(left, right) do
    left / right
  end

end
