require_relative '../lib/computer.rb'
require 'pry'

apple = Computer.new('apple', 'imac')
apple2 = Computer.new('apple', 'macbook pro')
apple3 = Computer.new('apple', 'macbook air')
alien = Computer.new('alienware', 'aurora')
acer = Computer.new('acer', 'predator')
micro = Computer.new('microsoft', 'surface')
msi = Computer.new('msi', 'meg')

binding.pry