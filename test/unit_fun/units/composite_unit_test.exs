defmodule UnitFun.Units.CompositeUnitTests do
  use ExUnit.Case

  alias UnitFun.Units.CompositeUnit
  alias UnitFun.Units.CompositeUnitTests.Meters
  alias UnitFun.Units.CompositeUnitTests.Newtons

  test "Units can be multipied together" do
    newton_meters = Meters.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    expected = %CompositeUnit{numerators: [Newtons.unit, Meters.unit]}
    assert newton_meters == expected
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
