defmodule UnitFun.Components.AddSubtract do
  @moduledoc false

  alias UnitFun.Value
  alias UnitFun.Maths.AddSubtractMaths
  import UnitFun.Conversion.ConversionHelper, only: [convert_to: 2]

  for method <- [:add, :subtract] do
    def unquote(method)(%Value{units: x} = left, %Value{units: x} = right) do
      new_value = AddSubtractMaths.unquote(method)(x, left.value, right.value)
      %Value{value: new_value, units: x}
    end

    def unquote(method)(%Value{units: left_units} = left_side, right_side) do
      updated_right_side = right_side |> convert_to(left_units)
      unquote(method)(left_side, updated_right_side)
    end
  end

  def add(left, right) do
    left + right
  end

  def subtract(left, right) do
    left - right
  end

end
