defmodule UnitFun do

  alias UnitFun.Components.Equality
  alias UnitFun.Components.Multiply
  alias UnitFun.Components.Divide
  alias UnitFun.Components.AddSubtract
  alias UnitFun.Components.Assert

  alias UnitFun.Units.UnitSimplifier
  alias UnitFun.UnitTypes

  def equal(left, right),    do: left |> Equality.equal(right)       |> simplify
  def multiply(left, right), do: left |> Multiply.multiply(right)    |> simplify
  def divide(left, right),   do: left |> Divide.divide(right)        |> simplify
  def add(left, right),      do: left |> AddSubtract.add(right)      |> simplify
  def subtract(left, right), do: left |> AddSubtract.subtract(right) |> simplify

  def with_units(value, units),   do: UnitTypes.with_units(value, units)
  def assert_units(value, units), do: Assert.assert_units(value, units)

  defp simplify(unit), do: UnitSimplifier.simplify_unit(unit)
end
