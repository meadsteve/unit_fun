defmodule UnitFun.ConvertorComplexTest do
  use ExUnit.Case

  alias UnitFun.ConvertorComplexTest.Meters
  alias UnitFun.ConvertorComplexTest.Newtons
  alias UnitFun.ConvertorComplexTest.Pascals

  test "1 N/M is a pascal" do
    newtons_per_meter = UnitFun.divide(Newtons, Meters)
    input = UnitFun.with_units(1, newtons_per_meter)
    output = UnitFun.with_units(input, Pascals)

    assert output.value == 1
    assert output.units == Pascals.unit
  end

end


defmodule UnitFun.ConvertorComplexTest.Meters do
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorComplexTest.Newtons do
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorComplexTest.Pascals do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ConvertorComplexTest.Pascals do
  alias UnitFun.ConvertorComplexTest.Meters
  alias UnitFun.ConvertorComplexTest.Newtons
  alias UnitFun.Units.CompositeUnit

  def convert(_, %CompositeUnit{numerators: [%Newtons{}], denominators: [%Meters{}]}, value) do
    value
  end
end
