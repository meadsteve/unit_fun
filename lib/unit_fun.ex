defmodule UnitFun do
  alias UnitFun.Components.Equality
  alias UnitFun.Components.Multiply
  alias UnitFun.Components.AddSubtract

  def equal(left, right), do: Equality.equal(left, right)
  def multiply(left, right), do: Multiply.multiply(left, right)
  def add(left, right), do: AddSubtract.add(left, right)
  def subtract(left, right), do: AddSubtract.subtract(left, right)

end
