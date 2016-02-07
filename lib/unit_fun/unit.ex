defmodule UnitFun.Unit do

  defmacro __using__(_opts) do
    quote do
      @behaviour UnitFun.UnitDefinition

      defstruct size: 1, type: :primitive_unit

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
