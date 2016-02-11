defmodule UnitFunMulitplicationTest do
  use ExUnit.Case
  alias UnitFun.Value

  alias UnitFunMulitplicationTest.Meters
  alias UnitFunMulitplicationTest.Newtons

  alias UnitFun.Units.CompositeUnit

  import UnitFun, only: [{:multiply, 2}]

  test "multiplication of matching units works" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 5, units: Meters.unit}

    meters_squared = Meters.unit
      |> CompositeUnit.multiply_unit(Meters.unit)

    expected = %Value{value: 10, units: meters_squared}
    assert value_one |> multiply(value_two) == expected
  end

  test "multiplication of different (unconvertable) units works" do
    value_one = %Value{value: 2, units: Meters.unit}
    value_two = %Value{value: 4, units: Newtons.unit}

    newton_meters = Meters.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    expected = %Value{value: 8, units: newton_meters}
    assert value_one |> multiply(value_two) == expected
  end

  test "values with units can be multiplied by a scalar" do
    value_one = %Value{value: 2, units: Meters.unit}
    scalar = 5

    expected = %Value{value: 10, units: Meters.unit}
    assert value_one |> multiply(scalar) == expected
  end

  test "scalars can be multiplied by values with units" do
    scalar = 5
    value_with_units = %Value{value: 2, units: Meters.unit}

    expected = %Value{value: 10, units: Meters.unit}
    assert scalar |> multiply(value_with_units) == expected
  end

  test "multiplication works when given bare numbers" do
    value_one = 2
    value_two = 5

    expected = 10
    assert value_one |> multiply(value_two) == expected
  end

end
