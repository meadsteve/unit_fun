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

  @doc ~S"""
  Multiples two quantities together. If either or both quantities have units
  new composite units will be created.

  ## Examples

  ### Plain values
    iex> UnitFun.multiply(2, 3)
    6

  ### One united value and one plain number
    iex> left  = 5 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 2
    iex> answer = UnitFun.multiply(left, right)
    iex> answer |> UnitFun.assert_units(UnitFun.Examples.SimpleUnit)
    iex> answer.value
    10

  ### Both united numbers
    iex> left  = 5 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 2 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> answer = UnitFun.multiply(left, right)
    iex> square_units = UnitFun.multiply(UnitFun.Examples.SimpleUnit, UnitFun.Examples.SimpleUnit)
    iex> answer |> UnitFun.assert_units(square_units)
    iex> answer.value
    10

  """
  def multiply(left, right), do: left |> Multiply.multiply(right)    |> simplify

  @doc ~S"""
  Divides the left by the right. If either or both quantities have units
  new composite units will be created.

  ## Examples

  ### Plain values
    iex> UnitFun.divide(6, 3)
    2.0

  ### Both values have the same units
    iex> left  = 8 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 2 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> UnitFun.divide(left, right)
    4.0

  ### Both values have units but they are different
    iex> left  = 8 |> UnitFun.with_units(UnitFun.Examples.SimpleUnit)
    iex> right = 2 |> UnitFun.with_units(UnitFun.Examples.OtherUnit)
    iex> answer = UnitFun.divide(left, right)
    iex> simple_per_other_units = UnitFun.divide(UnitFun.Examples.SimpleUnit, UnitFun.Examples.OtherUnit)
    iex> answer |> UnitFun.assert_units(simple_per_other_units)
    iex> answer.value
    4.0

  """
  def divide(left, right),   do: left |> Divide.divide(right)        |> simplify

  def equal(left, right),    do: left |> Equality.equal(right)

  def with_units(value, units),   do: UnitTypes.with_units(value, units)
  def assert_units(value, units), do: Assert.assert_units(value, units)

  defp simplify(unit), do: UnitSimplifier.simplify_unit(unit)
end
