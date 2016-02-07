defmodule UnitFun.DslTest do
  use ExUnit.Case

  alias UnitFun.Dsl
  require Dsl

  test "Dsl can define units" do
    Dsl.define_unit Rads
    amount = UnitFun.with_units(4, Rads)
    assert amount.value == 4
    assert amount.units == Rads.unit
  end
  
end
