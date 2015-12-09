defmodule UnitFun.Units.CompositeUnitTests do
  use ExUnit.Case

  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Units.CompositeUnitTests.Meters
  alias UnitFun.Units.CompositeUnitTests.Newtons
  alias UnitFun.Units.CompositeUnitTests.Seconds

  test "Units can be multipied together" do
    newton_meters = Meters.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    expected = %CompositeUnit{numerators: [Newtons.unit, Meters.unit]}
    assert newton_meters == expected
  end

  test "Units can be divided by each other" do
    newton_meters = Meters.unit
      |> CompositeUnit.divide_unit(Seconds.unit)

    expected = %CompositeUnit{numerators: [Meters.unit], denominators: [Seconds.unit]}
    assert newton_meters == expected
  end

  test "Composite units can be multipied together" do
    newton_meters = %CompositeUnit{numerators: [Newtons.unit, Meters.unit]}
    newton_per_second = %CompositeUnit{numerators: [Newtons.unit],
                                       denominators: [Seconds.unit]}

    combined = newton_meters
      |> CompositeUnit.multiply_unit(newton_per_second)
    expected = %CompositeUnit{numerators: [Newtons.unit, Newtons.unit, Meters.unit],
                              denominators: [Seconds.unit]}
    assert combined == expected
  end

  test "Order is not important when units are multipied together" do
    newton_meters = Meters.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    meter_newtons = Newtons.unit
      |> CompositeUnit.multiply_unit(Meters.unit)

    assert meter_newtons == newton_meters
  end
end

defmodule UnitFun.Units.CompositeUnitTests.Meters do
  use UnitFun.Unit
end

defmodule UnitFun.Units.CompositeUnitTests.Newtons do
  use UnitFun.Unit
end

defmodule UnitFun.Units.CompositeUnitTests.Seconds do
  use UnitFun.Unit
end
