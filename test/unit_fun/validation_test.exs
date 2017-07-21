defmodule UnitFun.Validation.UnitTests do
  use ExUnit.Case

  alias UnitFun.Examples.SimpleUnit
  alias UnitFun.Examples.PositiveUnit

  import UnitFun.UnitTypes

  test "Units without facts are always valid" do
    10
    |> with_units(SimpleUnit)
    |> UnitFun.Validation.valid?
    |> assert
  end

  test "Units with a single fact are valid if the fact is true" do
    10
    |> with_units(PositiveUnit)
    |> UnitFun.Validation.valid?
    |> assert
  end

  test "Units with a single fact are invalid if the fact is false" do
    -10
    |> with_units(PositiveUnit)
    |> UnitFun.Validation.valid?
    |> refute
  end

end
