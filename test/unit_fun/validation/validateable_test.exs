defmodule UnitFun.Validation.UnitTests do
  use ExUnit.Case

  alias UnitFun.Examples.SimpleUnit
  alias UnitFun.Examples.PositiveUnit

  test "Units without facts are always valid" do
    assert UnitFun.Validation.Validateable.valid?(SimpleUnit, 10)
  end

  test "Units with a single fact are valid if the fact is true" do
    assert UnitFun.Validation.Validateable.valid?(PositiveUnit, 10)
  end

  test "Units with a single fact are invalid if the fact is false" do
    assert UnitFun.Validation.Validateable.valid?(PositiveUnit, -10) === false
  end

end
