defmodule UnitFun.UnitTypesTest do
  use ExUnit.Case
  alias UnitFun.Value

  import UnitFun.UnitTypes
  alias UnitFun.UnitTypesTest.Kilometers

  test "with_units macro converts to appropriate struct" do
    value = 2 |> with_units Kilometers
    assert value == %Value{value: 2, units: Kilometers.unit}
  end

end

defmodule UnitFun.UnitTypesTest.Kilometers do
  use UnitFun.Unit
end
