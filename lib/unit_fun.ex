defmodule UnitFun do
  @moduledoc """
  Adds units to numbers in elixir to give some added type saftey when dealing with numeric quantities.
  """

  alias UnitFun.Components.Equality
  alias UnitFun.Components.Multiply
  alias UnitFun.Components.Divide
  alias UnitFun.Components.AddSubtract
  alias UnitFun.Components.Assert

  alias UnitFun.Units.UnitSimplifier
  alias UnitFun.UnitTypes

  @doc ~S"""
  Adds together two values. If the units mismatch a conversion will be attempted
  if this isn't possible an error will be raised.

  ## Examples

  ### Plain values
    iex> UnitFun.add(3, 7)
    10

  ### Matching units
    iex> left  = 3 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 5 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> UnitFun.add(left, right).value
    8

  ### Mismatched units
    iex> left  = 3 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 5 |> UnitFun.with_units(UnitFun.Examples.OtherUnit)
    iex> UnitFun.add(left, right).value
    ** (UnitFun.Errors.MissingConversionError) No conversions into Elixir.UnitFun.Examples.SimpleUnit implemented

  """
  def add(left, right),      do: left |> AddSubtract.add(right)      |> simplify

  @doc ~S"""
  Subtracts one value from the other. If the units mismatch a conversion will be attempted
  if this isn't possible an error will be raised.

  ## Examples

  ### Plain values
    iex> UnitFun.subtract(7, 3)
    4

  ### Matching units
    iex> left  = 5 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 2 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> UnitFun.subtract(left, right).value
    3

  ### Mismatched units
    iex> left  = 5 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 3 |> UnitFun.with_units(UnitFun.Examples.OtherUnit)
    iex> UnitFun.subtract(left, right).value
    ** (UnitFun.Errors.MissingConversionError) No conversions into Elixir.UnitFun.Examples.SimpleUnit implemented

  """
  def subtract(left, right), do: left |> AddSubtract.subtract(right) |> simplify
  def multiply(left, right), do: left |> Multiply.multiply(right)    |> simplify
  def divide(left, right),   do: left |> Divide.divide(right)        |> simplify

  def equal(left, right),    do: left |> Equality.equal(right)

  def with_units(value, units),   do: UnitTypes.with_units(value, units)
  def assert_units(value, units), do: Assert.assert_units(value, units)

  defp simplify(unit), do: UnitSimplifier.simplify_unit(unit)
end
