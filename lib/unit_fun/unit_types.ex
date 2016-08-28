defmodule UnitFun.UnitTypes do
  @moduledoc """
  Provides functions for applying units on top of bare values. Normally imported
      import UnitFun.UnitTypes
      ten_pence = 10 |> with_units(Pence)
      # or
      twenty_pence = 20 <~ Pence
  """
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Conversion.ConversionHelper

  def with_units(%Value{} = value, new_units) when is_atom(new_units) do
    with_units(value, new_units.unit)
  end

  def with_units(%Value{} = value, new_units)  do
    value |> ConversionHelper.convert_to(new_units)
  end

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
