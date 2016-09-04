defmodule UnitFun.Examples.OtherUnit do
  @moduledoc false
  use UnitFun.Unit

  def_conversion UnitFun.Examples.OtherUnit, UnitFun.Examples.OtherUnitConverted, fn value ->
    value * 2
  end
end
