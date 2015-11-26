defmodule UnitFunEqualityTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunEqualityTest.Meters
  alias UnitFun.Errors.MissingConversionError

  import UnitFun, only: [{:equal, 2}]

  test "matching units can be compared" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 2, units: Meters.unit}
    assert value_one |> equal(value_two)
  end
end

defmodule UnitFunEqualityTest.Meters do
  use UnitFun.Unit
end
