# Your code here
require 'weapons/bow.rb'
describe Bow do
  let(:bow){Bow.new}
  it "#defaults to 10 arrow" do
    expect(bow.arrows).to eq(10)
  end

  it "#creates a bow wth 3 arrows" do
    expect(Bow.new(3).arrows).to eq(3)
  end

  it "#decrements the number of arrows" do
    bow.use
    expect(bow.arrows).to eq(9)
  end

  it "#cannot shoot with 0 arrows" do
    expect{Bow.new(0).use}.to raise_error("Out of arrows")
  end
end
