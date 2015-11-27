defmodule UnitFun.UnitTypes do
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit

  def with_units(value, composite_unit = %CompositeUnit{})  do
    %Value{value: value, units: composite_unit}
  end

  def with_units(value, unit_module) when is_atom(unit_module) do
    %Value{value: value, units: unit_module.unit}
  end

  def with_units(value, %{type: :primitive_unit} = unit) do
    %Value{value: value, units: unit}
  end

  def left <~ right do
    with_units(left, right)
  end

end
