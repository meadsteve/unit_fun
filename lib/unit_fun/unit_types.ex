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
  alias UnitFun.Errors.MissingUnitsError

  @doc ~S"""
  Takes a bare value and wraps it in a struct with units.

  ## Examples

  ### With a module defined as units
      iex> 5 |> UnitFun.UnitTypes.with_units(UnitFun.Examples.SimpleUnit)
      %UnitFun.Value{units: %UnitFun.Examples.SimpleUnit{size: 1, type: :primitive_unit}, value: 5}

  ### Errors thrown for undefined units
      iex> 5 |> UnitFun.UnitTypes.with_units(:anyoldatom)
      ** (UnitFun.Errors.MissingUnitsError) Units anyoldatom are not defined

  """
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
    try do
      %Value{value: value, units: unit_module.unit}
    rescue
      _error in UndefinedFunctionError
        -> raise MissingUnitsError, message: "Units #{unit_module} are not defined"
    end
  end

  def with_units(value, %{type: :primitive_unit} = unit) do
    %Value{value: value, units: unit}
  end

  @doc ~S"""
  <~ is provided as a shorthand for calling with_units

  ## Example usage
      iex> import UnitFun.UnitTypes
      iex> 5 <~ UnitFun.Examples.SimpleUnit
      %UnitFun.Value{units: %UnitFun.Examples.SimpleUnit{size: 1, type: :primitive_unit}, value: 5}

  """
  def left <~ right do
    with_units(left, right)
  end

end
