defmodule UnitFun.Dsl do

  defmacro define_unit(name) do
    quote do
      defmodule unquote(name) do
        use UnitFun.Unit
      end
    end
  end

end
