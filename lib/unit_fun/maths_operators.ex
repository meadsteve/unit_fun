defmodule UnitFun.MathsOperators do

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}, {:-, 2}, {:==, 2}, {:*, 2}, {:/, 2}]
      alias UnitFun.Units.CompositeUnit
      alias UnitFun.Units.UnitSimplifier

      def left + right do
        left
          |> UnitFun.add(right)
          |> UnitSimplifier.simplify_unit
      end

      def left - right do
        left
          |> UnitFun.subtract(right)
          |> UnitSimplifier.simplify_unit
      end

      # allow unit atoms to be built up using the mutliply/divide symbols
      def left * right when is_atom(left) or is_atom(right)  do
        left
          |> CompositeUnit.multiply_unit(right)
          |> UnitSimplifier.simplify_unit
      end

      def left / right when is_atom(left) or is_atom(right)  do
        left
          |> CompositeUnit.divide_unit(right)
          |> UnitSimplifier.simplify_unit
      end

      def left * right do
        left
          |> UnitFun.multiply(right)
          |> UnitSimplifier.simplify_unit
      end

      def left / right do
        left
          |> UnitFun.divide(right)
          |> UnitSimplifier.simplify_unit
      end

      def left == right do
        UnitFun.equal(left, right)
      end
    end
  end

end
