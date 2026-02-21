require_relative 'line_list'

class Cat

  def initialize(path_list, options = {})
    @path_list = path_list
    @options = options
    @lines = LineList.new(readlines, options)
  end

  def exec
    puts @lines.modified_lines
  end

  private

    def readlines
      @path_list.each_with_object([]) do |path, lines|
        File.foreach(path) { |line| lines << line }
      end
    end
end
