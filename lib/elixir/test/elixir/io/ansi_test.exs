Code.require_file "../../test_helper.exs", __FILE__

defmodule IO.ANSITest do
  use ExUnit.Case, async: true

  test :escape_single do
    assert IO.ANSI.escape("Hello, #[red]world!#[reset]") ==
           "Hello, #{IO.ANSI.red}world!#{IO.ANSI.reset}"
    assert IO.ANSI.escape("Hello, #[ red ]world!#[reset]") ==
           "Hello, #{IO.ANSI.red}world!#{IO.ANSI.reset}"

  end

  test :escape_multiple do
    assert IO.ANSI.escape("Hello, #[red,bright]world!#[reset]") ==
           "Hello, #{IO.ANSI.red}#{IO.ANSI.bright}world!#{IO.ANSI.reset}"
    assert IO.ANSI.escape("Hello, #[red, bright]world!#[reset]") ==
           "Hello, #{IO.ANSI.red}#{IO.ANSI.bright}world!#{IO.ANSI.reset}"
    assert IO.ANSI.escape("Hello, #[red , bright]world!#[reset]") ==
           "Hello, #{IO.ANSI.red}#{IO.ANSI.bright}world!#{IO.ANSI.reset}"
  end

  test :no_emit do
    assert IO.ANSI.escape("Hello, #[red,bright]world!#[reset]", false) ==
           "Hello, world!"
  end

end
