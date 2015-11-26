defmodule UnitFun.MathsOperatorsTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunTest.MathsOperatorsTest.Meters

  # This will switch + out to use the UnitFun version
  use UnitFun.MathsOperators

  test "Addition of matching units works using the + symbol" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 5, units: Meters.unit}

    expected_sum = %Value{value: 7, units: Meters.unit}
    assert value_one + value_two == expected_sum
  end

  test "subtraction of matching units works using the - symbol" do
    value_one = %Value{value: 5, units: Meters.unit}
    value_two = %Value{value: 2, units: Meters.unit}

    expected_result = %Value{value: 3, units: Meters.unit}
    assert value_one - value_two == expected_result
  end

  test "equality of matching units works using the == symbol" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 2, units: Meters.unit}

    assert value_one == value_two
  end

end

defmodule UnitFunTest.MathsOperatorsTest.Meters do
  use UnitFun.Unit
end
