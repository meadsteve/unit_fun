defprotocol UnitFun.Maths.MultiplicationMaths do
  @fallback_to_any true

  def multiply(units, left, right)
end

defimpl UnitFun.Maths.MultiplicationMaths, for: Any do
  def multiply(_, left, right), do: left * right
end
