defmodule UnitFun.Examples.PositiveUnit do
  @moduledoc false
  use UnitFun.Unit

  defp greater_than_zero(x), do: x >= 0

  facts([
    &greater_than_zero/1
  ])
end
