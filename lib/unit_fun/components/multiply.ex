defmodule UnitFun.Components.Multiply do
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Maths.MultiplicationMaths

  def multiply(%Value{value: left, units: x}, %Value{value: right, units: y}) do
    new_units = x |> CompositeUnit.multiply_unit(y)
    new_value = MultiplicationMaths.multiply(left, right)
    %Value{value: new_value, units: new_units}
  end

  def multiply(%Value{value: left, units: units}, scalar_right) do
    new_value = MultiplicationMaths.multiply(left, scalar_right)
    %Value{value: new_value, units: units}
  end

  def multiply(scalar_left, %Value{} = right) do
    multiply(right, scalar_left)
  end

  def multiply(left, right) do
    left * right
  end

end
