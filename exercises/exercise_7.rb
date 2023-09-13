require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 6 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: {
    only_integer: true ,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  }
  validates :store, presence: true
end

puts "Enter a store name"
name = gets.chomp

store = Store.new(name: name)

if store.save
  puts "Success create store"
else
  puts store.errors.full_messages
end