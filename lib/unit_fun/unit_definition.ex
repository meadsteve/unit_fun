defmodule UnitFun.UnitDefinition do
  @moduledoc """
  Unitfun uses modules to represent units. All units must implement this behaviour.
  """

  @callback unit() :: any

end
