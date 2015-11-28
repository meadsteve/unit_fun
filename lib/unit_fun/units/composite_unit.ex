defmodule UnitFun.Units.CompositeUnit do
  defstruct numerators: []

  def new_with_numerator(%{type: :primitive_unit} = unit) do
    %__MODULE__{numerators: [unit]}
  end

  def multiply_unit(%__MODULE__{numerators: numerators}, %{type: :primitive_unit} = unit) do
    %__MODULE__{numerators: [unit | numerators]}
      |> simplify
  end

  def multiply_unit(%__MODULE__{} = base, unit_module)
  when is_atom(unit_module) do
    multiply_unit(base, unit_module.unit)
  end

  def multiply_unit(unit_module, %__MODULE__{} = base)
  when is_atom(unit_module) do
    multiply_unit(base, unit_module.unit)
  end

  def multiply_unit(%{type: :primitive_unit} = first, %{type: :primitive_unit} = second) do
    new_with_numerator(first) |> multiply_unit(second)
  end

  def multiply_unit(first_module, second_module)
  when is_atom(first_module) and is_atom(second_module)
  do
    new_with_numerator(first_module.unit)
      |> multiply_unit(second_module.unit)
  end

  defp simplify(%__MODULE__{numerators: numerators}) do
     %__MODULE__{numerators: sort_types(numerators)}
  end

  defp sort_types(numerators) do
     numerators |> Enum.sort(&type_order/2)
  end

  defp type_order(x, y) do
     to_string(x.__struct__) > to_string(y.__struct__)
  end
end
