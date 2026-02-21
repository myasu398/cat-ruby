class LineList
  def initialize(lines, options = {})
    @lines = lines
    @options = options
  end

  def modified_lines
    modify!
  end

  def modify!
    if @options[:squeeze_blank]
      lines = @lines.chunk { |line| line.strip.empty? }
      @lines = lines.map do |is_blank, chunk|
        is_blank ? '' : chunk
      end.flatten
    end

    if @options[:line_numbers_non_blank]
      add_line_numbers(skip_blank: true)
    elsif @options[:line_numbers]
      add_line_numbers
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

    @lines
  end

  private

    def add_line_numbers(skip_blank: false)
      index = 0
      @lines.map! do |line|
        next line if skip_blank && line.strip.empty?
        index += 1
        "#{index} #{line}"
      end
    end

    def blank_line_chunk
      @lines.chunk { |line| line.strip.empty? }
    end

    def squeeze_blank_lines
      @lines = blank_line_chunk.map { |is_blank, chunk| is_blank ? '' : chunk }.flatten
    end
end
