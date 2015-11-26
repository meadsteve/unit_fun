defmodule UnitFun.Unit do

  defmacro __using__(_opts) do
    quote do
      defstruct size: 1
      def unit do
        %__MODULE__{}
      end
    end
  end

end
