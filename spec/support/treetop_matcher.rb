require 'rspec/expectations'

RSpec::Matchers.define :parse do |string, root|
  match do |parser|
    root ||= :document
    parser.parse(string, :root => root) != nil
  end

  failure_message_for_should do |parser|
   "Parsing failed with the following error: #{parser.failure_reason.inspect}"
  end
end
