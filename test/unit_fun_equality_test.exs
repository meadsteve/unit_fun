defmodule UnitFunEqualityTest do
  use ExUnit.Case
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit

  alias UnitFunEqualityTest.Meters
  alias UnitFunEqualityTest.Newtons

  import UnitFun, only: [{:equal, 2}]

  test "matching units can be compared" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 2, units: Meters.unit}
    assert value_one |> equal(value_two)
  end

  test "CompositeUnits can be compared" do
    newton_meters = Meters.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    value_one = %Value{value: 2, units: newton_meters}
    value_two = %Value{value: 2, units: newton_meters}

    assert value_one |> equal(value_two)
  end


  test "bare values can be compared" do
    value_one = 2
    value_two = 2
    assert value_one |> equal(value_two)
  end

end

defmodule UnitFunEqualityTest.Meters do
  use UnitFun.Unit
end

defmodule UnitFunEqualityTest.Newtons do
  use UnitFun.Unit
end
