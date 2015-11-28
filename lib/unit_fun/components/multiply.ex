defmodule UnitFun.Components.Multiply do
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit

  def multiply(%Value{value: left, units: x}, %Value{value: right, units: y}) do
    new_units = x |> CompositeUnit.multiply_unit(y)
    %Value{value: left * right, units: new_units}
  end

  def multiply(%Value{value: left, units: units}, scalar_right) do
    %Value{value: left * scalar_right, units: units}
  end

  def multiply(scalar_left, %Value{} = right) do
    multiply(right, scalar_left)
  end

  def multiply(left, right) do
    left * right
  end

end
