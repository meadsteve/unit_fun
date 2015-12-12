defprotocol UnitFun.Maths.MultiplicationMaths do
  @fallback_to_any true

  def multiply(left, right)
end

defimpl UnitFun.Maths.MultiplicationMaths, for: Any do
  def multiply(left, right), do: left * right
end
