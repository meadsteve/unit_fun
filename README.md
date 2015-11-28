UnitFun
=======

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

item_cost = 5 <~ Pounds
item_tax = 100 <~ Pence

# The following will throw an error as the units mismatch:
item_cost + item_tax
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
total = item_cost + item_tax

total_in_pence = total <~ Pence
# returns: %UnitFun.Value{value: 600, units: Pence}
```
