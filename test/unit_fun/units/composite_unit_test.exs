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
end

defmodule UnitFun.Units.CompositeUnitTests.Meters do
  use UnitFun.Unit
end

defmodule UnitFun.Units.CompositeUnitTests.Newtons do
  use UnitFun.Unit
end
