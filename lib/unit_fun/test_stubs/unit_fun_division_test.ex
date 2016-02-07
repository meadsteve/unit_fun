defmodule UnitFunDivisionTest.Meters do
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Second do
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Miles do
  use UnitFun.Unit
end


defimpl UnitFun.Convertor, for: UnitFunDivisionTest.Meters do
  alias UnitFunDivisionTest.Miles

  def convert(_, Miles, value) do
    value * 1.6 * 1000
  end
end
