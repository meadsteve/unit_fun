defmodule UnitFun.ExampleTest do
  use ExUnit.Case

  alias UnitFun.ExampleTest.Kilometers
  alias UnitFun.ExampleTest.Miles

  use UnitFun.MathsOperators
  import UnitFun.UnitTypes

  test "Full example" do
    distance_on_foot = 4 <~ Kilometers
    distance_by_train = 100 <~ Miles

    expected_total_distance_in_km    = 164 <~ Kilometers
    expected_total_distance_in_miles = 102.5 <~ Miles

    assert distance_on_foot + distance_by_train  == expected_total_distance_in_km
    assert distance_on_foot + distance_by_train  == expected_total_distance_in_miles
  end

end


defmodule UnitFun.ExampleTest.Kilometers do
  use UnitFun.Unit
end

defmodule UnitFun.ExampleTest.Miles do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ExampleTest.Kilometers do
  import UnitFun.UnitTypes
  alias UnitFun.ExampleTest.Miles
  alias UnitFun.ExampleTest.Kilometers

  def convert(_, Miles, value) do
    (value * 1.6) <~ Kilometers
  end
end
