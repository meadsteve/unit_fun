defmodule UnitFun.Units.CompositeUnit do
  defstruct numerators: [], denominators: []

  def new_with_numerator(%{type: :primitive_unit} = unit) do
    %__MODULE__{numerators: [unit]}
  end

  def multiply_unit(%__MODULE__{} = left, %__MODULE__{} = right) do
    %__MODULE__{
      numerators: left.numerators |> Enum.into(right.numerators),
      denominators: left.denominators |> Enum.into(right.denominators)
    }
      |> order_elements
  end

  def multiply_unit(%__MODULE__{numerators: numerators} = initial, %{type: :primitive_unit} = unit) do
    %{initial | numerators: [unit | numerators]}
      |> order_elements
  end

  def divide_unit(%__MODULE__{denominators: denominators} = initial, %{type: :primitive_unit} = unit) do
    %{initial | denominators: [unit | denominators]}
      |> order_elements
  end

  def divide_unit(1, unit) do
    divide_unit(%__MODULE__{}, unit)
  end

  def standardise(%__MODULE__{} = type) do
    type
      |> order_elements
  end

  for fun <- [:multiply_unit, :divide_unit] do

    def unquote(fun)(%__MODULE__{} = base, unit_module)
    when is_atom(unit_module) do
      unquote(fun)(base, unit_module.unit)
    end

    def unquote(fun)(%{type: :primitive_unit} = first, %{type: :primitive_unit} = second) do
      new_with_numerator(first) |> unquote(fun)(second)
    end

    def unquote(fun)(first_module, second_module)
    when is_atom(first_module) and is_atom(second_module)
    do
      new_with_numerator(first_module.unit)
        |> unquote(fun)(second_module.unit)
    end

  end

  def multiply_unit(unit_module, %__MODULE__{} = base)
  when is_atom(unit_module) do
    multiply_unit(base, unit_module.unit)
  end

  def multiply_unit(%{type: :primitive_unit} = unit, %__MODULE__{} = complex) do
    multiply_unit(complex, unit)
  end

  defp order_elements(%__MODULE__{} = initial) do
    %{initial |
      numerators: sort_types(initial.numerators),
      denominators: sort_types(initial.denominators)
    }
  end

  defp sort_types(numerators) do
     numerators |> Enum.sort(&type_order/2)
  end

  defp type_order(x, y) do
     to_string(x.__struct__) > to_string(y.__struct__)
  end
end

defimpl String.Chars, for: UnitFun.Units.CompositeUnit do
  def to_string(type) do
    numerator_string = type.numerators
      |> Enum.map(&unit_to_sting/1)
      |> Enum.join(" * ")
    denominator_string = type.denominators
      |> Enum.map(&unit_to_sting/1)
      |> Enum.join(" * ")
    "Composite type: [#{numerator_string}] / [#{denominator_string}]"
  end

  def unit_to_sting(unit), do: Kernel.to_string(unit.__struct__)
end
