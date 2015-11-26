defmodule UnitFunUsingTest do
  use ExUnit.Case
  alias UnitFun.Value

  # This will switch + out to use the UnitFun version
  use UnitFun

  test "Addition of matching units works using the + symbol" do
    value_one = %Value{value: 2, units: :meters}
    value_two = %Value{value: 5, units: :meters}

    expected_sum = %Value{value: 7, units: :meters}
    assert value_one + value_two == expected_sum
  end

end
