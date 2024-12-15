require 'optparse'
require_relative 'cat'

class Cli
  def initialize(argv)
    @options = {}

    opt = OptionParser.new
    opt.on('-n') { |v| @options[:line_numbers] = v }
    opt.on('-b') { |v| @options[:line_numbers_non_blank] = v }
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
