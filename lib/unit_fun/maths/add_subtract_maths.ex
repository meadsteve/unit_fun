defprotocol UnitFun.Maths.AddSubtractMaths do
  @fallback_to_any true

  def add(left, right)
  def subtract(left, right)
end

defimpl UnitFun.Maths.AddSubtractMaths, for: Any do
  def add(left, right),      do: left + right
  def subtract(left, right), do: left - right
end
