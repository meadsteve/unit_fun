defmodule UnitFun.Components.Divide do
  @moduledoc false

  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]
  alias UnitFun.Errors.MissingConversionError
  alias UnitFun.Maths.DivisionMaths
  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Value

  def divide(left, right) when is_atom(left) or is_atom(right) do
    left |> CompositeUnit.divide_unit(right)
  end

  def divide(1, right) when is_atom(right) do
    1 |> CompositeUnit.divide_unit(right)
  end

  def divide(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    DivisionMaths.divide(x, left, right)
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
    new_value = DivisionMaths.divide(units, left, scalar_right)
    %Value{value: new_value, units: units}
  end

  def divide(scalar_left, %Value{value: right, units: units}) do
    new_units = CompositeUnit.divide_unit(1, units)
    new_value = DivisionMaths.divide(new_units, scalar_left, right)
    %Value{value: new_value, units: new_units}
  end

  def divide(left, right) do
    left / right
  end

  defp composite_unit_div(left, right) do
    new_units = CompositeUnit.divide_unit(left.units, right.units)
    new_value = DivisionMaths.divide(left.units, left.value, right.value)
    %Value{value: new_value, units: new_units}
  end

end
