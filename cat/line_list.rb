class LineList
  def initialize(options = {})
    @options = options
    @line_number = 0
    @previous_blank_line = false
  end

  def process(line)
    line = squeeze_blank(line)
    return nil unless line

    add_line_number(line)
  end

  private

    def squeeze_blank(line)
      return line unless @options[:squeeze_blank]
      return non_blank_line(line) unless line.strip.empty?
      return nil if @previous_blank_line

      @previous_blank_line = true
      "\n"
    end

    def non_blank_line(line)
      @previous_blank_line = false
      line
    end

    def add_line_number(line)
      if @options[:line_numbers_non_blank]
        return line if line.strip.empty?
      elsif !@options[:line_numbers]
        return line
      end

      @line_number += 1
      "#{@line_number} #{line}"
    end
end
