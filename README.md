UnitFun
=======
[![Build Status](https://travis-ci.org/meadsteve/unit_fun.svg)](https://travis-ci.org/meadsteve/unit_fun)

Attempt to add units to numbers in elixir to give some added type saftey when dealing with numeric quantities.

## Why?
One good example: pounds(dollars) should never be accidentally added to pence(cents) without conversion. Both are numeric. Wrapping the numeric data in a tuple with unit information seems like a good idea. This library gives a neat way of expressing this.

## Example
First define some units:
```elixir
defmodule Pounds do
  use UnitFun.Unit
end

defmodule Pence do
  use UnitFun.Unit
end
```

Then do something with them:
```elixir
use UnitFun.MathsOperators
import UnitFun.UnitTypes

item_cost = 5 <~ Pounds # UnitFun.with_units(5, Pounds)
item_tax = 100 <~ Pence # UnitFun.with_units(100, Pence)

# The following will throw an error as the units mismatch:
item_cost + item_tax # UnitFun.add(item_cost, item_tax)
```  

Conversions can be defined:
```elixir
defimpl UnitFun.Convertor, for: Pence do
  def convert(_, Pounds, value), do: (value * 100)
end

defimpl UnitFun.Convertor, for: Pounds do
  def convert(_, Pence, value), do: (value / 100)
end
```
And now the following:
```elixir
# returns: %UnitFun.Value{value: 6, units: Pounds}
total = item_cost + item_tax # UnitFun.add(item_cost, item_tax)

# returns: %UnitFun.Value{value: 600, units: Pence}
total_in_pence = total <~ Pence # UnitFun.with_units(total, Pence)
```

## Example squared
New units can also be composed by multiplying existing units together:

```elixir
  use UnitFun.MathsOperators
  import UnitFun.UnitTypes

  km_squared = Kilometers * Kilometers # UnitFun.multiply(Kilometers, Kilometers)
```

These newly defined units can then be used as with all previous examples
```elixir
  edge = 4 <~ Kilometers # UnitFun.with_units(4, Kilometers)

  area = edge * edge # UnitFun.multiply(edge, edge)

  expected_area = 16 <~ km_squared # UnitFun.with_units(16, km_squared)
  assert area == expected_area # UnitFun.equals(area, expected_area)
```

Dividing/multiplying by united types returns values with new types so correctness can be asserted on.
```elixir
  miles_per_hour = Miles / Hours # UnitFun.divide(Miles, Hours)

  speed = 40 <~ miles_per_hour # UnitFun.with_units(40, miles_per_hour)
  time_spent_travelling = 2 <~ Hours # UnitFun.with_units(2, hours)

  #the distance will be in Miles as the hours cancel out
  distance_travelled_in_two_hours = time_spent_travelling * speed  # UnitFun.multiply(time_spent_travelling, speed)

  assert distance_travelled_in_two_hours == 80 <~ Miles # UnitFun.with_units(80, Miles)
```
