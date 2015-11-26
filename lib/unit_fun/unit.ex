defmodule UnitFun.Unit do

  defmacro __using__(_opts) do
    quote do
      defstruct size: 1

      @unit_atom __MODULE__

      def unit do
        %@unit_atom{}
      end

      defimpl String.Chars, for: @unit_atom do
        def to_string(thing) do
          "#{thing.__struct__}"
        end
      end
    end
  end

end
