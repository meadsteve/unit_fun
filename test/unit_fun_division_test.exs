defmodule UnitFunDivisionTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunDivisionTest.Meters
  alias UnitFunDivisionTest.Miles
  #alias UnitFunDivisionTest.Newtons


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

  test "division by a scalar quantitiy keeps the same units" do
    value_one = %Value{value: 10, units: Meters.unit}
    value_two = 5

    expected = %Value{value: 2, units: Meters.unit}
    assert value_one |> divide(value_two) == expected
  end

  test "division of bare unwrapped values works" do
    value_one = 9
    value_two = 3

    expected = 3
    assert value_one |> divide(value_two) == expected
  end

end

defmodule UnitFunDivisionTest.Meters do
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Newtons do
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Miles do
  use UnitFun.Unit
end


defimpl UnitFun.Convertor, for: UnitFunDivisionTest.Meters do
  alias UnitFunDivisionTest.Miles

  def convert(_, Miles, value) do
    value * 1.6 * 1000
  end
end
