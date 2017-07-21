defmodule UnitFun.Validation.Assertions do
  @moduledoc false

  def assert_constraints(%UnitFun.Value{value: value, units: units} = x) do
    if not UnitFun.Validation.valid?(x) do
      raise UnitFun.Errors.InvalidValueError, message: "Value: #{value} is not valid for #{units}"
    end
  end

  def assert_constraints(_), do: nil

end