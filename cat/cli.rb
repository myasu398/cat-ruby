require 'optparse'
require_relative 'cat'

class Cli
  def initialize(argv)
    @options = {}

    opt = OptionParser.new
    opt.on('-n', 'print with numbers') { |v| @options[:line_numbers] = v }
    opt.on('-b', 'print with numbers, non-blank lines') { |v| @options[:line_numbers_non_blank] = v }
    opt.on('-s', 'squeeze blank lines') { |v| @options[:squeeze_blank] = v }
    opt.parse!(argv)

    if argv.empty?
      puts 'Usage: cagt [options] [file ...]'
      exit 1
    end

    @path_list = argv
  end

  def exec
    cat = Cat.new(@path_list, @options)
    cat.exec
  end
end
