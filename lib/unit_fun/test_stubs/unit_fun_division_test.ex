defmodule UnitFunDivisionTest.Meters do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Second do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFunDivisionTest.Miles do
  @moduledoc false
  use UnitFun.Unit
end


defimpl UnitFun.Convertor, for: UnitFunDivisionTest.Meters do
  @moduledoc false
  alias UnitFunDivisionTest.Miles

  def convert(_, Miles, value) do
    value * 1.6 * 1000
  end
end
