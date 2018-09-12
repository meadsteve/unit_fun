defmodule UnitFun.Conversion.ConversionHelper do
  @moduledoc false

  alias UnitFun.Convertor
  alias UnitFun.Errors.MissingConversionError
  alias UnitFun.Units.CompositeUnit

  import UnitFun.UnitTypes

  def convert_to(%{units: units, value: value}, to_units) do
    from_units = atom_or_composite(units)
    updated_val = try do
      Convertor.convert(to_units, from_units, value)
    rescue
      _ in FunctionClauseError
        -> raise MissingConversionError,
           message: "Can't convert #{from_units} into #{to_units}"
      _ in Protocol.UndefinedError
        -> raise MissingConversionError,
           message: "No conversions into #{to_units} implemented"
    end
    updated_val <~ to_units
  end

  defp atom_or_composite(%CompositeUnit{} = units), do: units
  defp atom_or_composite(units), do: units.__struct__

end
