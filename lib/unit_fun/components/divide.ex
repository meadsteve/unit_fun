defmodule UnitFun.Components.Divide do
  alias UnitFun.Value

  def divide(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    left / right
  end

  def divide(%Value{value: left, units: units}, scalar_right) do
    %Value{value: left / scalar_right, units: units}
  end

  def divide(left, right) do
    left / right
  end

end
