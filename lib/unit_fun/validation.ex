defmodule UnitFun.Validation do
  @moduledoc """
  Valudites if a UnitFun.Value is a legal.
  All units provide a function called facts() that returns a list of functions.
  """

  def valid?(%UnitFun.Value{units: units, value: value}) do
    units.__struct__.facts()
    |> Enum.map(fn fact -> fact.(value) end)
    |> Enum.all?(&(&1 == true))
  end
end
