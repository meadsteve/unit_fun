defmodule UnitFun.ConvertorTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFun.ConvertorTest.Kilometers
  alias UnitFun.ConvertorTest.Miles
  alias UnitFun.ConvertorTest.Furlongs

  test "Protocol is used to convert mismatched units" do
    value_one = %Value{value: 1, units: Kilometers.unit}
    value_two = %Value{value: 1, units: Miles.unit}

    expected_sum = %Value{value: 2.6, units: Kilometers.unit}
    assert value_one |> UnitFun.add(value_two) == expected_sum
  end

  test "Call can still fail if no valid conversion is defined" do
    value_one = %Value{value: 1, units: Kilometers.unit}
    value_two = %Value{value: 1, units: Furlongs.unit}

    assert_raise FunctionClauseError, fn ->
      value_one |> UnitFun.add(value_two)
    end
  end
end


defmodule UnitFun.ConvertorTest.Kilometers do
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorTest.Miles do
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorTest.Furlongs do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ConvertorTest.Kilometers do
  alias UnitFun.Value
  alias UnitFun.ConvertorTest.Miles
  alias UnitFun.ConvertorTest.Kilometers

  def convert(_, Miles, value) do
    %Value{value: value * 1.6, units: Kilometers.unit}
  end
end
