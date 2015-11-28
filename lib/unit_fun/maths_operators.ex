defmodule UnitFun.MathsOperators do

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}, {:-, 2}, {:==, 2}, {:*, 2}]
      alias UnitFun.Units.CompositeUnit

      def left + right do
        UnitFun.add(left, right)
      end

      def left - right do
        UnitFun.subtract(left, right)
      end

      # allow unit atoms to be built up using the mutliply symbol
      def left * right when is_atom(left) and is_atom(right)  do
        left |> CompositeUnit.multiply_unit(right)
      end

      def left * right when is_atom(left) or is_atom(right)  do
        left |> CompositeUnit.multiply_unit(right)
      end

      def left * right do
        UnitFun.multiply(left, right)
      end

      def left == right do
        UnitFun.equal(left, right)
      end
    end
  end

end
