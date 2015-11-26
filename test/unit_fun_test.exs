defmodule UnitFunTest do
  use ExUnit.Case
  alias UnitFun.Value

  test "Addition of matching units works" do
    value_one = %Value{value: 2, units: :meters}
    value_two = %Value{value: 5, units: :meters}

    expected_sum = %Value{value: 7, units: :meters}
    assert value_one |> UnitFun.add(value_two) == expected_sum
  end

  test "can't add mismatched units" do
    value_one = %Value{value: 2, units: :meters}
    value_two = %Value{value: 5, units: :seconds}

    assert_raise FunctionClauseError, "no function clause matching in UnitFun.add/2", fn ->
      value_one |> UnitFun.add(value_two)
    end
  end

end
