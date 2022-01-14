require './lib/pet'

RSpec.describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end

  it 'exists' do

    expect(@samson).to be_a(Pet)
  end

  it 'has a name' do

    expect(@samson.name).to eq 'Samson'
  end

  it 'has an age' do

    expect(@samson.type).to eq :dog
  end

  it 'is #fed?' do

    expect(@samson.fed?).to eq false
  end

  it 'it can #feed the pet' do
    @samson.feed

    expect(@samson.fed?).to eq true
  end
end
