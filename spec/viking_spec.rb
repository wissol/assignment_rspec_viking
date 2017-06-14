# Your code here
require 'viking.rb'
describe Viking do
  let(:viki){Viking.new(name="Viki")}

  it "#Creates a Viking with a given name" do
    expect(viki.name).to eq("Viki")
  end

  it "#drops health when attacked" do
    viki.receive_attack(20)
    expect(viki.health).to eq(80)
  end

  it "#tells the player what happend when attacked" do
    viki.receive_attack(20)
  end
end
