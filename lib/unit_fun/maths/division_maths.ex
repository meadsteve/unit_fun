defprotocol UnitFun.Maths.DivisionMaths do
  @fallback_to_any true

  def divide(units, left, right)
end

defimpl UnitFun.Maths.DivisionMaths, for: Any do
  def divide(_, left, right), do: left / right
end
