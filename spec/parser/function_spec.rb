require 'spec_helper'

require 'fling/parser/function'

describe Fling::FunctionParser do
  subject { Fling::FunctionParser.new }

  before(:all) do
    Fling::FunctionParser.send(:include, Fling::Common)
    Fling::FunctionParser.send(:include, Fling::Statement)
    Fling::FunctionParser.send(:include, Fling::FlingClass)
  end

  it "should allow a statement on the same line" do
    subject.should parse("def my_method: my_statement()", :method)
  end

  it "should allow a block of statements" do
    subject.should parse("def my_method\n  my_statement\nend", :method)
  end

  it "should allow a block of multiple statements" do
    subject.should parse("def my_method\n  my_statement\n  another_statment\nend", :method)
    subject.should parse("def my_method\n  x\n  y\n  z\nend", :method)
  end

  it "should allow an internal method definition" do
    subject.should parse("def a\n  def b: x\nend", :method)
    subject.should parse("def a\n  def b\n    x\n  end\nend", :method)
  end
end
