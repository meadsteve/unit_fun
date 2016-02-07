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
