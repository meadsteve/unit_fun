defmodule UnitFun.MathsOperators do

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}, {:-, 2}, {:==, 2}, {:*, 2}, {:/, 2}]
      alias UnitFun.Units.CompositeUnit

      def left + right do
        left |> UnitFun.add(right)
      end

      def left - right do
        left |> UnitFun.subtract(right)
      end

      # allow unit atoms to be built up using the mutliply/divide symbols
      def left * right when is_atom(left) or is_atom(right)  do
        left |> CompositeUnit.multiply_unit(right)
      end

      def left / right when is_atom(left) or is_atom(right)  do
        left |> CompositeUnit.divide_unit(right)
      end

      def left * right do
        left |> UnitFun.multiply(right)
      end

      def left / right do
        left |> UnitFun.divide(right)
      end

      def left == right do
        UnitFun.equal(left, right)
      end
    end
  end

end
