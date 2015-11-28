defmodule UnitFun.UnitTypesTest do
  use ExUnit.Case
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit

  import UnitFun.UnitTypes
  alias UnitFun.UnitTypesTest.Kilometers
  alias UnitFun.UnitTypesTest.Miles
  alias UnitFun.UnitTypesTest.Newtons

  test "with_units function converts to appropriate struct" do
    value = 2 |> with_units Kilometers
    assert value == %Value{value: 2, units: Kilometers.unit}
  end

  test "with_units function converts values that already have units" do
    value = 1 |> with_units Miles
    changed_value = value |> with_units Kilometers
    assert changed_value == %Value{value: 1.6, units: Kilometers.unit}
  end

  test "with_units function supports composite units" do
    newton_kilometers = Kilometers.unit
      |> CompositeUnit.multiply_unit(Newtons.unit)

    value = 2 |> with_units newton_kilometers
    assert value == %Value{value: 2, units: newton_kilometers}
  end

end

defmodule UnitFun.UnitTypesTest.Kilometers do
  use UnitFun.Unit
end

defmodule UnitFun.UnitTypesTest.Miles do
  use UnitFun.Unit
end

defmodule UnitFun.UnitTypesTest.Newtons do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.UnitTypesTest.Kilometers do
  alias UnitFun.UnitTypesTest.Miles

  def convert(_, Miles, value) do
    value * 1.6
  end
end
