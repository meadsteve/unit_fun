defmodule UnitFun.ExampleTest do
  use ExUnit.Case

  alias UnitFun.ExampleTest.Kilometers
  alias UnitFun.ExampleTest.Miles
  alias UnitFun.ExampleTest.Hours
  alias UnitFun.ExampleTest.Pence

  use UnitFun.MathsOperators
  import UnitFun.UnitTypes

  test "Full example - single units" do
    distance_on_foot = 4 <~ Kilometers
    distance_by_train = 100 <~ Miles

    expected_total_distance_in_km    = 164 <~ Kilometers
    expected_total_distance_in_miles = 102.5 <~ Miles

    assert distance_on_foot + distance_by_train  == expected_total_distance_in_km
    assert distance_on_foot + distance_by_train  == expected_total_distance_in_miles

    miles_per_hour = Miles / Hours
    speed = 40 <~ miles_per_hour
    time_spent_travelling = 2 <~ Hours

    distance_travelled_in_two_hours = time_spent_travelling * speed
    assert distance_travelled_in_two_hours == 80 <~ Miles
    UnitFun.assert_units(distance_travelled_in_two_hours, Miles)
  end

  test "Full example - squared units" do
    km_squared = Kilometers * Kilometers

    edge = 4 <~ Kilometers

    area = edge * edge

    expected_area_in_km_squared = 16 <~ km_squared
    assert area == expected_area_in_km_squared
  end

  test "Full example - cubic units" do
    km_cubed = Kilometers * Kilometers * Kilometers

    edge = 3 <~ Kilometers

    volume = edge * edge * edge

    expected_vol_in_cubic_km = 27 <~ km_cubed
    assert volume == expected_vol_in_cubic_km
  end

  test "overriden + - which doesn't allow floats" do
    money_okay = 5 <~ Pence
    money_not_okay = 5.4 <~ Pence
    assert_raise FunctionClauseError, fn ->
      money_not_okay + money_okay
    end
  end

end
