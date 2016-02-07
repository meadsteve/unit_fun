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
  alias UnitFun.ConvertorTest.Miles

  def convert(_, Miles, value) do
    value * 1.6
  end
end
