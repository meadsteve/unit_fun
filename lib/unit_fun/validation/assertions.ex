defmodule UnitFun.Validation.Assertions do
  @moduledoc false

  alias UnitFun.Validation
  alias UnitFun.Errors.InvalidValueError

  def assert_constraints(%UnitFun.Value{value: value, units: units} = x) do
    if not Validation.valid?(x) do
      raise InvalidValueError, message: "Value: #{value} is not valid for #{units}"
    end
  end

  def assert_constraints(_), do: nil
end
