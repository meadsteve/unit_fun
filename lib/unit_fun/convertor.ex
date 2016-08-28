defprotocol UnitFun.Convertor do
  @moduledoc """
  Implementing this protocol definines a relationship into units.
  An example of this should be Pence and Pounds:

      defimpl UnitFun.Convertor, for: Pence do
        def convert(_, Pounds, value), do: (value * 100)
      end
  """
  def convert(into_units, from_units, value)
end
