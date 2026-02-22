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
      assert_output('', /cat: \.\/tests\/not_found\.txt: No such file or directory/) { cli.exec }
    end
    assert_equal 1, error.status
  end

  def test_exec_with_empty_file
    cli = Cli.new(['./tests/empty.txt'])
    assert_output('') { cli.exec }
  end

  def test_exec_with_squeeze_blank_and_leading_blank_lines
    cli = Cli.new(['-s', './tests/leading_blank.txt'])
    assert_output("\nstart\nend\n") { cli.exec }
  end

  def test_exec_with_squeeze_blank_and_trailing_blank_lines
    cli = Cli.new(['-s', './tests/trailing_blank.txt'])
    assert_output("start\n\n") { cli.exec }
  end

  def test_exec_with_squeeze_blank_across_multiple_files
    cli = Cli.new(['-s', './tests/squeeze_boundary_a.txt', './tests/squeeze_boundary_b.txt'])
    assert_output("aaa\n\nbbb\n") { cli.exec }
  end

  def test_exec_with_show_ends
    cli = Cli.new(['-E', './tests/example.txt'])
    assert_output("aaa$\nbbb$\n$\n$\n$\nccc$\n") { cli.exec }
  end

  def test_exec_with_line_numbers_non_blank_and_show_ends
    cli = Cli.new(['-b', '-E', './tests/example.txt'])
    assert_output("1 aaa$\n2 bbb$\n$\n$\n$\n3 ccc$\n") { cli.exec }
  end
end
