defmodule ExTracingTest do
  use ExUnit.Case
  doctest ExTracing

  test "greets the world" do
    assert ExTracing.hello() == :world
  end
end
