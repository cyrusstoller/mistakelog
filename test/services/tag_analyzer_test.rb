require 'test_helper'

class TagAnalyzerServiceTest < ActiveSupport::TestCase
  test "should pass through a plain string" do
    input = 'plain text'
    tas = TagAnalyzerService.new(input)
    assert_equal tas.analyze, input
  end

  test "should convert a single tag" do
    input = 'hello #world'
    output = 'hello [#world](/tags/world)'
    tas = TagAnalyzerService.new(input)
    assert_equal tas.analyze, output
  end

  test "should convert multiple tags" do
    input = 'hello #world blah #bar'
    output = 'hello [#world](/tags/world) blah [#bar](/tags/bar)'
    tas = TagAnalyzerService.new(input)
    assert_equal tas.analyze, output
  end

  test "should have the tags in an accessible array" do
    input = 'hello #world #world blah #bar'
    tas = TagAnalyzerService.new(input)
    tas.analyze
    assert_equal tas.tags, ['world', 'bar']
  end
end
