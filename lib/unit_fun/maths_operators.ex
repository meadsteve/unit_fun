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
