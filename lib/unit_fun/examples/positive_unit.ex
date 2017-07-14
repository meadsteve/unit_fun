defmodule UnitFun.Examples.PositiveUnit do
  @moduledoc false
  use UnitFun.Unit

  facts [
    fn x -> x >= 0 end
  ]

end
