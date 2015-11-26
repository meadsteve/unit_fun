defmodule UnitFun do
  alias UnitFun.Value

  def add(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    %Value{value: left + right, units: x}
  end

  def subtract(left, %Value{value: right, units: units}) do
    add(left, %Value{value: -right, units: units})
  end

end
