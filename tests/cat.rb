require_relative '../cat/cli'

require 'minitest/autorun'

class CatTest < Minitest::Test
  def test_exec
    cli = Cli.new(['./tests/example.txt'])
    assert_output("aaa\nbbb\n\nccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers
    cli = Cli.new(['-n', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n3 \n4 ccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers_non_blank
    cli = Cli.new(['-b', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n\n3 ccc\n") { cli.exec }
  end

  def test_exec_multiple_files
    cli = Cli.new(['./tests/example.txt', './tests/example2.txt'])
    assert_output("aaa\nbbb\n\nccc\neee\nfff\n") { cli.exec }
  end
end
