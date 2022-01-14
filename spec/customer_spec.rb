require './lib/customer'
require './lib/pet'

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
  end

  it 'exists' do

    expect(@joel).to be_a Customer
  end

  it 'has a name' do

    expect(@joel.name).to eq 'Joel'
  end

  it 'has an id' do

    expect(@joel.id).to eq 2
  end

  it 'has no pets by default' do

    expect(@joel.pets).to eq ([])
  end

  it 'customer can adopt an animal' do
    @joel.adopt(@samson)
    @joel.adopt(@lucy)

    expect(@joel.pets).to eq ([@samson, @lucy])
  end

  it 'has a default outstanding balance of 0' do

    expect(@joel.outstanding_balance).to eq 0
  end

  it 'can be #charge' do
    @joel.charge(15)
    @joel.charge(7)

    expect(@joel.outstanding_balance).to eq 22
  end
end
