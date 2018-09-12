defmodule UnitFun.Components.Multiply do
  @moduledoc false

  alias UnitFun.Maths.MultiplicationMaths
  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Value

  def multiply(left, right) when is_atom(left) or is_atom(right)  do
    left |> CompositeUnit.multiply_unit(right)
  end

  def multiply(%Value{value: left, units: x}, %Value{value: right, units: y}) do
    new_units = x |> CompositeUnit.multiply_unit(y)
    new_value = MultiplicationMaths.multiply(x, left, right)
    %Value{value: new_value, units: new_units}
  end

  def multiply(%Value{value: left, units: units}, scalar_right) do
    new_value = MultiplicationMaths.multiply(units, left, scalar_right)
    %Value{value: new_value, units: units}
  end

  def multiply(scalar_left, %Value{} = right) do
    multiply(right, scalar_left)
  end

  def multiply(left, right) do
    left * right
  end

end
