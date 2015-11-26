defmodule UnitFun.Units.CompositeUnit do
  defstruct numerators: []

  def new_with_numerator(%{type: :primitive_unit} = unit) do
    %__MODULE__{numerators: [unit]}
  end

  def multiply_unit(%__MODULE__{numerators: numerators}, %{type: :primitive_unit} = unit) do
    %__MODULE__{numerators: [unit | numerators]}
  end

  def multiply_unit(%{type: :primitive_unit} = first, %{type: :primitive_unit} = second) do
    new_with_numerator(first) |> multiply_unit(second)
  end
end
