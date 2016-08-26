defmodule UnitFun.ConvertorTest.Kilometers do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorTest.Miles do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorTest.Furlongs do
  @moduledoc false
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ConvertorTest.Kilometers do
  @moduledoc false
  alias UnitFun.ConvertorTest.Miles

  def convert(_, Miles, value) do
    value * 1.6
  end
end
