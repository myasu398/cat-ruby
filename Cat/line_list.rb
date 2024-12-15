class LineList
  def initialize(lines, options = {})
    @lines = lines
    @options = options
  end

  def modified_lines
    modify!
  end

  def modify!
    lines = @lines
    lines = add_line_numbers if @options[:line_numbers]

    if @options[:line_numbers_non_blank]
      # todo
    end

    if @options[:squeeze_blank]
      # todo
    end

    if @options[:display_non_printing]
      # todo
      if @options[:show_ends]
        # todo
      end
      if @options[:show_tabs]
        # todo
      end
    end

    if @options[:disable_output_buffering]
      # todo
    end

    lines
  end

  private

    def add_line_numbers
      @lines.each_with_index.map { |line, index| "#{index + 1} #{line}" }
    end
end
