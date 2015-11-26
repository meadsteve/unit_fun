defmodule UnitFunTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunTest.Meters
  alias UnitFunTest.Seconds
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
end


defmodule UnitFunTest.Meters do
  use UnitFun.Unit
end

defmodule UnitFunTest.Seconds do
  use UnitFun.Unit
end
