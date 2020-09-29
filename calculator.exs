defmodule Calculator do
  alias :timer, as: Timer

  def squared(x) do
    x * x
  end

  def multiply(x, y) do
    x * y
  end

  def sum_of(x, y) do
    x + y
  end

  def subtract(x, y) when x >= y do
    do_subtract(x, y)
  end

  def subtract(x, y) when x < y do
    Timer.sleep(1_000)
    "x must be bigger or equal to y"
  end


  defp do_subtract(x, y) do
    x - y
  end

  end
