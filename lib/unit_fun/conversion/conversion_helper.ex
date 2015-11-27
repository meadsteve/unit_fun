defmodule UnitFun.Conversion.ConversionHelper do
  alias UnitFun.Convertor
  alias UnitFun.Errors.MissingConversionError
  import UnitFun.UnitTypes

  def convert_to(%{units: units, value: value}, to_units) do
    from_units = units.__struct__
    updated_val = try do
      Convertor.convert(to_units, from_units, value)
    rescue
      _ in FunctionClauseError
        -> raise MissingConversionError, message: "Can't convert #{from_units} into #{to_units}"
      _ in Protocol.UndefinedError
        -> raise MissingConversionError, message: "No conversions into #{to_units} implemented"
    end
    updated_val <~ to_units
  end

end
