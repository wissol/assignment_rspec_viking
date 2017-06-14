# Your code here
require 'viking.rb'
describe Viking do
  let(:viki){Viking.new(name="Viki")}
  let(:knut){Viking.new(name="Knut", health=150)}
  let(:axe){Axe.new}
  let(:bow){Bow.new}

  it "#Creates a Viking with a given name" do
    expect(viki.name).to eq("Viki")
  end

 it "#creates a viking with a specific health" do
    expect(knut.health).to eq(150)
  end

  it "cannot change health" do
    expect{knut.health = 120}.to raise_error(NoMethodError)
  end

  it "viking has nil weapon by default" do
    expect(knut.weapon).to eq(nil)
  end

  it "Picking up a Weapon sets it as the Viking's weapon" do
    knut.pick_up_weapon(axe)
    expect(knut.weapon).to eq(axe)
  end

  it "Picking up a non-Weapon raises an exception" do
    expect{knut.pick_up_weapon(viki)}.to raise_error("Can't pick up that thing")
  end

  it "Picking up a new Weapon replaces the Viking's existing weapon" do
    knut.pick_up_weapon(axe)
    knut.pick_up_weapon(bow)
    expect(knut.weapon).to eq(bow)
  end

  it "Dropping a Viking's weapon leaves the Viking weaponless" do
    knut.pick_up_weapon(axe)
    knut.drop_weapon
    expect(knut.weapon).to eq(nil)
  end

  it "#drops health when attacked" do
    viki.receive_attack(20)
    expect(viki.health).to eq(80)
  end

  it "the receive_attack method calls the take_damage method (hint: recall expect(...).to receive(...))" do
    expect(viki).to receive(:take_damage)
    viki.receive_attack(1)
  end

  it "attacking another Viking causes the recipient's health to drop" do
    knuts_starting_health = knut.health
    viki.attack(knut)
    expect(knut.health).to be < knuts_starting_health
  end

  it "attacking another Viking calls that Viking's take_damage method" do
    expect(knut).to receive(:take_damage)
    viki.attack(knut)
  end

  it "#attacking with no weapon runs damage_with_fists " do
    expect(viki).to receive(:damage_with_fists).and_return(2)
    viki.attack(knut)
  end

  it "attacking with no weapon deals Fists multiplier times strength damage!" do
    knut_starting_health = knut.health
    viki.attack(knut)
    dam = knut_starting_health - knut.health
    expect(dam).to eq(viki.strength * 0.25)
  end

  it "attacking with a weapon runs damage_with_weapon" do
    expect(viki).to receive(:damage_with_weapon).and_return(1)
    viki.pick_up_weapon(bow)
    viki.attack(knut)
  end

  it "attacking using a Bow without enough arrows uses Fists instead" do
    expect(viki).to receive(:damage_with_fists).and_return(19)
    empty_bow = Bow.new(arrows=0)
    viki.pick_up_weapon(empty_bow)
    viki.attack(viki)
  end

  it "Killing a Viking raises an error" do
    expect{viki.receive_attack(200)}.to raise_error(RuntimeError)
  end

end
