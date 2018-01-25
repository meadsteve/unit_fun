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
end
