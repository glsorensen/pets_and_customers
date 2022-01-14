require './lib/customer'
require './lib/pet'
require './lib/veterinary_clinic'

 RSpec.describe VeterinaryClinic do
 	before(:each) do
 		@vet = VeterinaryClinic.new("Bear Creek veterinary")
    @customer_1 = Customer.new("Joel", 2)
    @customer_2 = Customer.new("Lisa", 3)
    @pet_1 = Pet.new({name: "Samson", type: :dog, age: 3})
    @pet_2 = Pet.new({name: "Lucy", type: :cat, age: 12})
    @pet_3 = Pet.new({name: "Gato", type: :bird, age: 1})
    @pet_4 = Pet.new({name: "Sakic", type: :dog, age: 4})
 	end

 	it 'exists' do
 		expect(@vet).to be_a VeterinaryClinic
 	end

 	it 'has attributes' do
 		expect(@vet.name).to eq ("Bear Creek veterinary")
 	end

  it 'customers have pets' do

    @customer_1.adopt(@pet_1)
    @customer_1.adopt(@pet_2)
    @customer_2.adopt(@pet_3)
    @customer_2.adopt(@pet_4)


    expect(@customer_1.pets).to eq ([@pet_1, @pet_2])
    expect(@customer_2.pets).to eq ([@pet_3, @pet_4])
  end

  it 'has customers' do
    @vet.add_customer(@customer_1)
    @vet.add_customer(@customer_2)

 		expect(@vet.customers).to eq ([@customer_1, @customer_2])
 	end

  describe 'set data' do
    before(:each) do
      @customer_1.adopt(@pet_1)
      @customer_1.adopt(@pet_2)
      @customer_2.adopt(@pet_3)
      @customer_2.adopt(@pet_4)

      @vet.add_customer(@customer_1)
      @vet.add_customer(@customer_2)
    end

    it 'can list pets' do

    expect(@vet.pet_sort).to eq ([@pet_2, @pet_4, @pet_1, @pet_3])
  end
  end

 end
