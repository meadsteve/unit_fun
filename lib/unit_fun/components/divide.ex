defmodule UnitFun.Components.Divide do
  alias UnitFun.Value
  alias UnitFun.Errors.MissingConversionError
  alias UnitFun.Units.CompositeUnit
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  def divide(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    left / right
  end

  def divide(%Value{units: left_units} = left, %Value{} = right) do
    try do
      updated_right = right |> convert_to(left_units)
      divide(left, updated_right)
    rescue
      _e in MissingConversionError -> composite_unit_div(left, right)
    end
  end

  def divide(%Value{value: left, units: units}, scalar_right) do
    %Value{value: left / scalar_right, units: units}
  end

  def divide(left, right) do
    left / right
  end

  defp composite_unit_div(left, right) do
    new_units = CompositeUnit.divide_unit(left.units, right.units)
    %Value{value: left.value / right.value, units: new_units}
  end

end
