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
      lines = add_line_numbers(skip_blank: true)
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

    def add_line_numbers(skip_blank: false)
      index = 0
      @lines.map do |line|
        next line if skip_blank && line.strip.empty?
        index += 1
        "#{index} #{line}"
      end
    end
end
