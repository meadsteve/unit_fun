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
