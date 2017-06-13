require("warmup.rb")

describe Warmup do
  let(:warmie){Warmup.new}


  # simulate gets
  before do
    $stdin = StringIO.new("James T. Kirk\n")
  end

  after do
    $stdin = STDIN
  end

  it "#something" do
    expect(warmie.gets_shout).to eq("JAMES T. KIRK")
  end

  it "#triples the length" do
    doubletriple = double([], size: 5)
    expect(warmie.triple_size(doubletriple)).to eq(15)
  end

  it "#calls some methods" do
    doublestring = double(empty?: false, upcase!: "POO", reverse!: "OOP")
    expect(doublestring).to receive(:upcase!)
    expect(doublestring.reverse!).to eq("OOP")
    expect(warmie.calls_some_methods(doublestring)).to eq("I am unrelated")
  end


end
