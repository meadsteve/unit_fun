defmodule UnitFun.ExampleTest do
  use ExUnit.Case

  alias UnitFun.ExampleTest.Kilometers
  alias UnitFun.ExampleTest.Miles
  alias UnitFun.Units.CompositeUnit

  use UnitFun.MathsOperators
  import UnitFun.UnitTypes

  test "Full example - single units" do
    distance_on_foot = 4 <~ Kilometers
    distance_by_train = 100 <~ Miles

    expected_total_distance_in_km    = 164 <~ Kilometers
    expected_total_distance_in_miles = 102.5 <~ Miles

    assert distance_on_foot + distance_by_train  == expected_total_distance_in_km
    assert distance_on_foot + distance_by_train  == expected_total_distance_in_miles
  end

  test "Full example - squared units" do
    km_squared = Kilometers
      |> CompositeUnit.multiply_unit Kilometers

    edge = 4 <~ Kilometers

    area = edge * edge

    expected_area_in_km_squared = 16 <~ km_squared
    assert area == expected_area_in_km_squared
  end

  test "Full example - cubic units" do
    km_cubed = Kilometers
      |> CompositeUnit.multiply_unit Kilometers
      |> CompositeUnit.multiply_unit Kilometers

    edge = 3 <~ Kilometers

    volume = edge * edge * edge

    expected_vol_in_cubic_km = 27 <~ km_cubed
    assert volume == expected_vol_in_cubic_km
  end

end


defmodule UnitFun.ExampleTest.Kilometers do
  use UnitFun.Unit
end

defmodule UnitFun.ExampleTest.Miles do
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ExampleTest.Kilometers do
  alias UnitFun.ExampleTest.Miles

  def convert(_, Miles, value) do
    (value * 1.6)
  end
end
