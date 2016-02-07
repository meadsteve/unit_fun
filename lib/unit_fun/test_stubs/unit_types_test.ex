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
