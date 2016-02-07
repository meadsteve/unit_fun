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

defmodule UnitFun.ExampleTest.Pence do
  use UnitFun.Unit
end

defimpl UnitFun.Maths.AddSubtractMaths, for: UnitFun.ExampleTest.Pence do
  def add(_, left, right) when is_integer(left) and is_integer(right) do
     left + right
  end
  def subtract(_, left, right) when is_integer(left) and is_integer(right) do
    left - right
  end
end
