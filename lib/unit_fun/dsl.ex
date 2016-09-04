defmodule UnitFun.Dsl do
  @moduledoc """
  [Experimental] Provides macros to create a domain specific language around
   units.
  """

  defmacro define_unit(name) do
    quote do
      defmodule unquote(name) do
        use UnitFun.Unit
      end
    end
  end

  defmacro def_conversion(from_units, into_units, fun) do
    quote do
      defimpl UnitFun.Convertor, for: unquote(into_units) do
        @moduledoc false

        def convert(_, unquote(from_units), value) do
          unquote(fun).(value)
        end
      end
    end
  end

end
