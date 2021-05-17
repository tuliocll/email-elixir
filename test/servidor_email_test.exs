defmodule ServidorEmailTest do
  use ExUnit.Case
  doctest ServidorEmail

  test "greets the world" do
    assert ServidorEmail.hello() == :world
  end
end
