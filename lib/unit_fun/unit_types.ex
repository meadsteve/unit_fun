defmodule UnitFun.UnitTypes do
  alias UnitFun.Value

  def with_units(value, unit_module) do
    %Value{value: value, units: unit_module.unit}
  end

  def left <~ right when is_atom(right) do
    with_units(left, right)
  end
end
