defmodule UnitFun.Validation do

  def valid?(%UnitFun.Value{units: units, value: value}) do
    units.__struct__.facts()
    |> Enum.map(fn fact -> fact.(value) end)
    |> Enum.all?(&(&1 == true))
  end

end