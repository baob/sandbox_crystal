require "spec"
require "../lib/greeter" # my greeter class

describe Greeter do
  describe "#shout" do
    it "returns upcased string" do
      Greeter.new.shout("hello world").should eq "HELLO WORLD"
    end
  end

  describe ".hello" do
    it "returns a static Hello string" do
      Greeter.hello.should eq "Hello"
    end
  end
end
