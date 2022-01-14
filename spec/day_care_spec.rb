require './lib/day_care'
require './lib/customer'
require './lib/pet'

 RSpec.describe DayCare do
 	describe 'initialize' do
    before(:each) do
   		@daycare = DayCare.new("Sunshine")
   	end

   	it 'exists' do
   		expect(@daycare).to be_a DayCare
   	end

   	it 'has attributes' do
   		expect(@daycare.name).to eq ("Sunshine")
   		expect(@daycare.customers).to eq ([])
   	end
  end

  describe 'add pets and customers' do
    before(:each) do
      @daycare = DayCare.new("Sunshine")
      @cust_1 = Customer.new("Joel", 2)
      @cust_2 = Customer.new("Alex", 1)
      @pet_1 = Pet.new({name: "Samson", type: :dog, age: 3})
      @pet_2 = Pet.new({name: "Lucy", type: :cat, age: 12})
      @pet_3 = Pet.new({name: "Joe", type: :dog, age: 4})
      @pet_4 = Pet.new({name: "Tim", type: :cat, age: 1})

      @cust_1.adopt(@pet_1)
      @cust_1.adopt(@pet_2)
      @cust_2.adopt(@pet_3)
      @cust_2.adopt(@pet_4)

      @daycare.add_customer(@cust_1)
      @daycare.add_customer(@cust_2)

      @pet_1.feed
      @pet_3.feed

    end

    it 'can add customers' do

      expect(@daycare.customers).to eq ([@cust_1, @cust_2])
    end

    it 'can find customers by ID' do

      expect(@daycare.customers_id(1)).to eq ([@cust_2])
      expect(@daycare.customers_id(2)).to eq ([@cust_1])
    end

    it 'can list unfed pets' do

      expect(@daycare.unfed).to eq ([@pet_2, @pet_4])
    end
  end
end
