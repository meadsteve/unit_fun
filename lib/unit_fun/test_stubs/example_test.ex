defmodule UnitFun.ExampleTest.Kilometers do
  use UnitFun.Unit
end

defmodule UnitFun.ExampleTest.Miles do
  use UnitFun.Unit
end

defmodule UnitFun.ExampleTest.Hours do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ExampleTest.Kilometers do
  alias UnitFun.ExampleTest.Miles

  def convert(_, Miles, value) do
    (value * 1.6)
  end
end
