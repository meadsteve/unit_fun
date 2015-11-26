defmodule UnitFun.MathsOperators do

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}]

      def left + right do
        UnitFun.add(left, right)
      end
    end
  end

end
