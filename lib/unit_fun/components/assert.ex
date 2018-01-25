defmodule UnitFun.Components.Assert do
  @moduledoc false

  alias UnitFun.Value
  alias UnitFun.Errors.UnitAssertionError

  def assert_units(value, units) when is_atom(units) do
    assert_units(value, units.unit)
  end

  def assert_units(%Value{units: matching_units} = value, matching_units) do
    value
  end

  def assert_units(%Value{units: left}, right) do
    raise UnitAssertionError, message: "Expected: #{right}; Got: #{left}"
  end

  def assert_units(left, right) do
    raise UnitAssertionError, message: "Expected value with units #{right}; Got: #{inspect(left)}"
  end
end
