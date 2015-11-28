defmodule UnitFun.Components.Equality do
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  alias UnitFun.Errors.CannotCompareError
  alias UnitFun.Errors.MissingConversionError

  def equal(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    left == right
  end

  def equal(%Value{units: left_units} = left_side, %Value{units: right_units} = right_side) do
    updated_right_side = try do
      right_side |> convert_to(left_units)
    rescue
      e in MissingConversionError
        -> raise CannotCompareError, message: "Can't compare #{left_units} to #{right_units}. " <> e.message
    end
    equal(left_side, updated_right_side)
  end

  def equal(left, right) do
    left == right
  end
end
