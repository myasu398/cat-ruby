require_relative '../cat/cli'

require 'minitest/autorun'

class CatTest < Minitest::Test
  def test_exec
    cli = Cli.new(['./tests/example.txt'])
    assert_output("aaa\nbbb\n\n\n\nccc\n") { cli.exec }
  end

  def test_exec_with_squeeze_blank
    cli = Cli.new(['-s', './tests/example.txt'])
    assert_output("aaa\nbbb\n\nccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers
    cli = Cli.new(['-n', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n3 \n4 \n5 \n6 ccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers_and_squeeze_blank
    cli = Cli.new(['-n', '-s', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n3 \n4 ccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers_non_blank
    cli = Cli.new(['-b', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n\n\n\n3 ccc\n") { cli.exec }
  end

  def test_exec_with_line_numbers_and_line_numbers_non_blank
    cli = Cli.new(['-n', '-b', './tests/example.txt'])
    assert_output("1 aaa\n2 bbb\n\n\n\n3 ccc\n") { cli.exec }
  end

  def test_exec_multiple_files
    cli = Cli.new(['./tests/example.txt', './tests/example2.txt'])
    assert_output("aaa\nbbb\n\n\n\nccc\neee\nfff\n") { cli.exec }
  end

  def test_exec_with_non_existing_file
    cli = Cli.new(['./tests/not_found.txt'])
    error = assert_raises(SystemExit) do
      assert_output('', /No such file or directory/) { cli.exec }
    end
    assert_equal 1, error.status
  end
end
