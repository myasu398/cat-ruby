require_relative 'line_list'

class Cat

  def initialize(path_list, options = {})
    @path_list = path_list
    @line_list = LineList.new(options)
  end

  def exec
    @path_list.each do |path|
      File.foreach(path) do |line|
        modified_line = @line_list.process(line)
        print modified_line if modified_line
      end
    end
  end
end
