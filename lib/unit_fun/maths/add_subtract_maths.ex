defprotocol UnitFun.Maths.AddSubtractMaths do
  @fallback_to_any true

  def add(units, left, right)
  def subtract(units, left, right)
end

defimpl UnitFun.Maths.AddSubtractMaths, for: Any do
  def add(_, left, right),      do: left + right
  def subtract(_, left, right), do: left - right
end
