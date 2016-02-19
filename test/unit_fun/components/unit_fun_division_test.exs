defmodule UnitFunDivisionTest do
  use ExUnit.Case
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit

  alias UnitFunDivisionTest.Meters
  alias UnitFunDivisionTest.Miles
  alias UnitFunDivisionTest.Second


  import UnitFun, only: [{:divide, 2}]

  test "division of matching units works returns a scalar value" do
    value_one = %Value{value: 10, units: Meters.unit}
    value_two = %Value{value: 5, units: Meters.unit}

    expected = 2
    assert value_one |> divide(value_two) == expected
  end

  test "division of convertable units returns a scalar value" do
    value_one = %Value{value: 1600, units: Meters.unit}
    value_two = %Value{value: 1, units: Miles.unit}

    expected = 1
    assert value_one |> divide(value_two) == expected
  end

  test "division of inconvertable units returns result with new units" do
    value_one = %Value{value: 10, units: Meters.unit}
    value_two = %Value{value: 2, units: Second.unit}


    meters_per_second = Meters.unit
      |> CompositeUnit.divide_unit(Second.unit)

    expected = %Value{value: 5, units: meters_per_second}
    assert value_one |> divide(value_two) == expected
  end

  test "division by a scalar quantitiy keeps the same units" do
    value_one = %Value{value: 10, units: Meters.unit}
    value_two = 5

    expected = %Value{value: 2, units: Meters.unit}
    assert value_one |> divide(value_two) == expected
  end

  test "division of a scalar quantitiy by a united one inverts the units" do
    value_one = 5
    value_two = %Value{value: 1, units: Meters.unit}

    inverse_meters = CompositeUnit.divide_unit(1, Meters.unit)

    expected = %Value{value: 5, units: inverse_meters}
    assert value_one |> divide(value_two) == expected
  end

  test "division of bare unwrapped values works" do
    value_one = 9
    value_two = 3

    expected = 3
    assert value_one |> divide(value_two) == expected
  end

end
