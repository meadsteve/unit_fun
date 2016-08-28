defmodule UnitFun.Unit do
  @moduledoc """
  `Use`ed by a module to generate the definition of a unit. For example the
  following code would define Pence:
      ```
      defmodule Pence do
        use UnitFun.Unit
      end
      ```
  """

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
