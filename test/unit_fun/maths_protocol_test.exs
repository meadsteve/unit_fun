defmodule UnitFun.MathsProtocolTest do
  use ExUnit.Case

  alias UnitFun.ExampleTest.Furlongs

  use UnitFun.MathsOperators
  import UnitFun.UnitTypes


  test "Furlongs are added using the custom protocol" do
    a = 5 <~ Furlongs
    b = 5 <~ Furlongs

    %{value: numeric_result} = (a + b)
    assert numeric_result == :add_protocol_used
  end

  test "Furlongs are subtracted using the custom protocol" do
    a = 5 <~ Furlongs
    b = 5 <~ Furlongs

    %{value: numeric_result} = (a - b)
    assert numeric_result == :sub_protocol_used
  end

  test "Furlongs are multiplied using the custom protocol" do
    a = 5 <~ Furlongs
    b = 5 <~ Furlongs

    %{value: numeric_result} = (a * b)
    assert numeric_result == :mulitply_protocol_used
  end

  test "Furlongs are divided using the custom protocol" do
    a = 5 <~ Furlongs
    b = 5 <~ Furlongs
    assert (a / b) == :division_protocol_used

    a = 5 <~ Furlongs
    %{value: numeric_result} = (a / 5)
    assert numeric_result == :division_protocol_used
  end

end



defmodule UnitFun.ExampleTest.Furlongs do
  use UnitFun.Unit
end

defimpl UnitFun.Maths.AddSubtractMaths, for: UnitFun.ExampleTest.Furlongs do
  def add(_, _left, _right) do
    :add_protocol_used
  end

  def subtract(_, _left, _right) do
    :sub_protocol_used
  end
end

defimpl UnitFun.Maths.MultiplicationMaths, for: UnitFun.ExampleTest.Furlongs do
  def multiply(_, _left, _right) do
    :mulitply_protocol_used
  end
end


defimpl UnitFun.Maths.DivisionMaths, for: UnitFun.ExampleTest.Furlongs do
  def divide(_, _left, _right) do
    :division_protocol_used
  end
end
