defprotocol UnitFun.Validation.Validateable do
  @moduledoc """
  Implementing this protocol allows the value of a unit to be validated
  """
  @fallback_to_any true

  def valid?(units, value)
end

defimpl UnitFun.Validation.Validateable, for: Any do
  def valid?(units, value) do
    units.facts()
    |> Enum.map(fn fact -> fact.(value) end)
    |> Enum.all?(fn result -> result == true end)
  end
end
