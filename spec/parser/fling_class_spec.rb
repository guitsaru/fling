require 'spec_helper'

require 'fling/parser/fling_class'

describe Fling::FlingClassParser do
  subject { Fling::FlingClassParser.new }

  before(:all) do
    Fling::FlingClassParser.send(:include, Fling::Common)
    Fling::FlingClassParser.send(:include, Fling::Statement)
    Fling::FlingClassParser.send(:include, Fling::Function)
  end

  it "should not allow lower case first letter" do
    subject.should_not parse("class c\n  def a: x\nend", :class)
  end

  it "should have an inner block" do
    subject.should parse("class C\n  def a: x\nend", :class)
  end

  it "should allow inner classes" do
    code = ["class MyClass",
            "  class InnerClass",
            "    def my_method: x",
            "  end",
            "end"].join("\n")

    subject.should parse(code, :class)
  end
end
