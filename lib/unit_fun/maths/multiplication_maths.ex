defprotocol UnitFun.Maths.DivisionMaths do
  @fallback_to_any true

  def divide(left, right)
end

defimpl UnitFun.Maths.DivisionMaths, for: Any do
  def divide(left, right), do: left / right
end
