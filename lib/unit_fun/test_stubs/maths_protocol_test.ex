defmodule UnitFun.ExampleTest.Furlongs do
  @moduledoc false
  use UnitFun.Unit
end

defimpl UnitFun.Maths.AddSubtractMaths, for: UnitFun.ExampleTest.Furlongs do
  @moduledoc false
  def add(_, _left, _right) do
    :add_protocol_used
  end

  def subtract(_, _left, _right) do
    :sub_protocol_used
  end
end

defimpl UnitFun.Maths.MultiplicationMaths, for: UnitFun.ExampleTest.Furlongs do
  @moduledoc false
  def multiply(_, _left, _right) do
    :mulitply_protocol_used
  end
end

defimpl UnitFun.Maths.DivisionMaths, for: UnitFun.ExampleTest.Furlongs do
  @moduledoc false
  def divide(_, _left, _right) do
    :division_protocol_used
  end
end
