defprotocol UnitFun.Maths.AddSubtractMaths do
  @moduledoc """
  Implementing this protocol allows custom additon / subtraction to occur.
  """
  @fallback_to_any true

  def add(units, left, right)
  def subtract(units, left, right)
end

defimpl UnitFun.Maths.AddSubtractMaths, for: Any do
  def add(_, left, right),      do: left + right
  def subtract(_, left, right), do: left - right
end
