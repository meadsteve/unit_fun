defmodule UnitFun.UnitTypesTest.Kilometers do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.UnitTypesTest.Miles do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.UnitTypesTest.Newtons do
  @moduledoc false
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.UnitTypesTest.Kilometers do
  @moduledoc false
  alias UnitFun.UnitTypesTest.Miles

  def convert(_, Miles, value) do
    value * 1.6
  end
end
