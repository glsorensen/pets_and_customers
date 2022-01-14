class VeterinaryClinic
 	attr_reader :name, :customers

 	def initialize(name)
 		@name = name
    @customers = []
 	end

  def add_customer(customer)
      @customers << customer
  end

  # def pet_sort
  #   pet_names = []
  #   @customers.map do |customer|
  #      pet_names << customer.pets
  #      # .map do |pet|
  #     #    pet_names << pet.name
  #   end
  #   age_sort = []
  #   pet_names.flatten
  #   require 'pry'; binding.pry
  #   pet_names.sort_by do |pet|
  #     age_sort << pet.age
  #   end
  #   age_sort# require 'pry'; binding.pry
  # end

  def pet_sort
    result = @customers.map do |customer|
      customer.pets
    end.flatten
    result.sort_by do |pet|
      pet.age
    end.reverse
  end
end
