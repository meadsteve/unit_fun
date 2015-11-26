defmodule UnitFun do
  alias UnitFun.Value
  # import Kernel, except: [{:+, 2}]

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}]

      def left + right do
        UnitFun.add(left, right)
      end

    end
  end

  def add(%Value{value: left, units: x}, %Value{value: right, units: x}) do
    %Value{value: left + right, units: x}
  end

end
