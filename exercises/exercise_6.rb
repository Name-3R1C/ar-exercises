require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1 = Store.find_by(id: 1)
@store2 = Store.find_by(id: 2)

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "A", last_name: "E", hourly_rate: 60)
@store1.employees.create(first_name: "B", last_name: "F", hourly_rate: 60)
@store2.employees.create(first_name: "C", last_name: "G", hourly_rate: 60)
@store2.employees.create(first_name: "D", last_name: "H", hourly_rate: 60)

puts @store1.employees.count
puts @store2.employees.count