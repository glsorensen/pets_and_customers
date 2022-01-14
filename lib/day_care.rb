class DayCare
 	attr_reader :name, :customers, :add_customer

 	def initialize(name)
 		@name = name
    @customers = []
 	end

  def add_customer(customer)
    @customers << customer
  end

  def customers_id(id)
    @customers.select {|customer| customer.id == id}
  end

  def unfed
    result = @customers.map do |customer|
      customer.pets
    end.flatten
    # require 'pry'; binding.pry
    result.find_all do |pet|
      pet.fed == false
    end
  end

  # def unfed
  #   pets = @customers.map {|customer| customer.pets}.flatten
  #
  #   pets.find_all do |pet|
  #     if pet.fed == false
  #     end
  #   end
  # end
end
require './lib/file_name'

RSpec.describe Template do
 	before(:each) do
 		@instance = Template.new(attribute)
 	end

 	it 'exists' do
 		expect(@instance).to be_a Template
 	end

 	it 'has attributes' do
 		expect(@instance.attribute).to eq (attribute)
 	end
 end
