defmodule UnitFunAdditionTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunAdditionTest.Meters
  alias UnitFunAdditionTest.Seconds
  alias UnitFun.Errors.MissingConversionError

  import UnitFun, only: [{:add, 2}]

  test "Addition of matching units works" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 5, units: Meters.unit}

    expected_sum = %Value{value: 7, units: Meters.unit}
    assert value_one |> add(value_two) == expected_sum
  end

  test "can't add mismatched units" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 5, units: Seconds.unit}

    assert_raise MissingConversionError, fn ->
      value_one |> add(value_two)
    end
  end

  test "Adding plain numbers falls back to the kernal add/2 func" do
    value_one = 2
    value_two = 5

    assert value_one |> add(value_two) == 7
  end

end
