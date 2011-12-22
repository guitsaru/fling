require 'spec_helper'

require 'fling/parser/statement'

describe Fling::StatementParser do
  subject { Fling::StatementParser.new }

  before(:all) do
    Fling::StatementParser.send(:include, Fling::Common)
    Fling::StatementParser.send(:include, Fling::Function)
  end

  it "should recognize a method call with no arguments" do
    subject.should parse("my_statement", :statement)
  end

  it "should allow empty parentheses" do
    subject.should parse("my_statement()", :statement)
  end

  it "should allow a single argument" do
    subject.should parse("my_statement(x)", :statement)
  end

  it "should allow multiple arguments" do
    subject.should parse("my_statement(x, y)", :statement)
  end
end
