defmodule UnitFun.Units.Components.AssertTests do
  use ExUnit.Case
  alias UnitFun.Components.Assert

  alias UnitFun.Errors.UnitAssertionError

  alias UnitFun.ExampleTest.Kilometers
  alias UnitFun.ExampleTest.Miles

  test "Assertion passes when units are correct and given as an atom" do
    amount = UnitFun.with_units(5, Kilometers)
    assert Assert.assert_units(amount, Kilometers) == amount
  end

  test "Assertion raises error when units are incorrect and given as an atom" do
    amount = UnitFun.with_units(5, Kilometers)
    assert_raise UnitAssertionError, "Expected: Elixir.UnitFun.ExampleTest.Miles; Got: Elixir.UnitFun.ExampleTest.Kilometers", fn ->
      Assert.assert_units(amount, Miles)
    end
  end

  test "Assertion passes when units are correct and composite units" do
    km_squared = UnitFun.multiply(Kilometers, Kilometers)
    amount = UnitFun.with_units(5, km_squared)
    assert Assert.assert_units(amount, km_squared) == amount
  end

  test "Assertion raises error when units are incorrect and composite units" do
    amount = UnitFun.with_units(5, Kilometers)
    km_squared = UnitFun.multiply(Kilometers, Kilometers)
    assert_raise UnitAssertionError, "Expected: Composite type: [Elixir.UnitFun.ExampleTest.Kilometers * Elixir.UnitFun.ExampleTest.Kilometers] / []; Got: Elixir.UnitFun.ExampleTest.Kilometers", fn ->
      Assert.assert_units(amount, km_squared)
    end
  end

end
