defmodule UnitFun.ConvertorComplexTest.Meters do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorComplexTest.Newtons do
  @moduledoc false
  use UnitFun.Unit
end

defmodule UnitFun.ConvertorComplexTest.Pascals do
  @moduledoc false
  use UnitFun.Unit
end

defimpl UnitFun.Convertor, for: UnitFun.ConvertorComplexTest.Pascals do
  @moduledoc false
  alias UnitFun.ConvertorComplexTest.Meters
  alias UnitFun.ConvertorComplexTest.Newtons
  alias UnitFun.Units.CompositeUnit

  def convert(_, %CompositeUnit{numerators: [%Newtons{}], denominators: [%Meters{}]}, value) do
    value
  end
end
