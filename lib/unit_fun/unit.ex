defmodule UnitFun.Unit do
  @moduledoc """
  `Use`ed by a module to generate the definition of a unit. For example the
  following code would define Pence:
      defmodule Pence do
        use UnitFun.Unit
      end
  """

  defmacro __using__(_opts) do
    quote do
      @behaviour UnitFun.UnitDefinition

      @facts_defined false

      @before_compile UnitFun.Unit
      import UnitFun.Unit

      defstruct size: 1, type: :primitive_unit

      @unit_atom __MODULE__

      @type t :: %UnitFun.Value{value: any, units: %__MODULE__{}}

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

  defmacro __before_compile__(_env) do
    quote do
      unless @facts_defined do
        def facts do
          []
        end
      end
    end
  end

  defmacro facts(list_of_facts) do
    quote do
      @facts_defined true
      def facts do
        unquote(list_of_facts)
      end
    end
  end
end
