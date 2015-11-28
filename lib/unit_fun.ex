defmodule UnitFun do
  alias UnitFun.Value
  alias UnitFun.Units.CompositeUnit
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  alias UnitFun.Errors.CannotCompareError
  alias UnitFun.Errors.MissingConversionError

  def add(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    %Value{value: left + right, units: x}
  end

  def add(%Value{units: left_units} = left_side, right_side) do
    updated_right_side = right_side |> convert_to(left_units)
    add(left_side, updated_right_side)
  end

  def add(left, right) do
    left + right
  end

  def subtract(left, %Value{value: right, units: units}) do
    add(left, %Value{value: -right, units: units})
  end

  def multiply(%Value{value: left, units: x}, %Value{value: right, units: y}) do
    new_units = x |> CompositeUnit.multiply_unit(y)
    %Value{value: left * right, units: new_units}
  end

  def multiply(%Value{value: left, units: units}, scalar_right) do
    %Value{value: left * scalar_right, units: units}
  end

  def multiply(scalar_left, %Value{} = right) do
    multiply(right, scalar_left)
  end

  def multiply(left, right) do
    left * right
  end

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
