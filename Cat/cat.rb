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

    def files
      @path_list.map { |path| File.open(path, 'r') }
    end

    def readlines
      files.flat_map { |file| file.readlines }
    end
end
