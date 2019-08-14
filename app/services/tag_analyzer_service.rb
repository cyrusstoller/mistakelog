class TagAnalyzerService
  attr_reader :raw_text
  attr_reader :tags
  attr_reader :processed_text

  def initialize(raw_text)
    @raw_text = raw_text
    @tags = []
    @processed_text = nil
  end

  def analyze
    temp_body = @raw_text.to_s.dup
    tag_regex = /(\A|\s)(#([a-zA-Z0-9_]+))/

    matches = temp_body.to_enum(:scan, tag_regex).map { Regexp.last_match }

    offset = 0

    # replace the matches
    matches.each do |match|
      first_index = match.offset(2)[0] + offset
      second_index = match.offset(2)[1] + offset
      tag = extracted_tag(match)
      @tags << tag

      replacement_str = "[##{tag}](/tags/#{tag})"
      temp_body[first_index...second_index] = replacement_str

      # Update the offset for when there are multiple matches
      offset += (replacement_str.length - (second_index - first_index))
    end

    @tags.uniq!
    @processed_text = temp_body
  end

  private

  def extracted_tag(match)
    # 0 is the full matched pattern
    # each subsequent index is responding to the () matching
    match[3] # based on regex above
  end

end
