defmodule UnitFun.Components.Equality do
  alias UnitFun.Value
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  alias UnitFun.Errors.CannotCompareError
  alias UnitFun.Errors.MissingConversionError

  def equal(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    left == right
  end

  def equal(%Value{} = left, %Value{} = right) do
    try do
      right
        |> convert_to(left.units)
        |> equal(left)
    rescue
      e in MissingConversionError -> raise_cannot_compare_error(e, left, right)
    end
  end

  def equal(left, right) do
    left == right
  end

  defp raise_cannot_compare_error(e, left, right) do
    message = "Can't compare #{left.units} to #{right.units}. " <> e.message
    raise CannotCompareError, message: message
  end

end
