require 'pry'

class Parcel
  attr_reader :id
  attr_accessor :address, :weight, :dimensions
  @@parcels = {}
  @@total_rows = 0
  def initialize(address, weight, dimensions, id)
    @address = address
    @weight = weight
    @dimensions = dimensions
    @id = id || @@total_rows += 1 #ask about this
  end
  def self.all()
    @@parcels.values()
  end
  def self.find(id)
    @@parcels[id]
  end
  def self.clear
   @@parcels = {}
   @@total_rows = 0
 end

  def save
    @@parcels[self.id] = Parcel.new(self.address, self.weight, self.dimensions, self.id)
  end
  # def ==(parcel_to_compare)
  #   self.address() == parcel_to_compare.address()
  # end
  def update(address)
    self.address = address
    @@parcels[self.id] = Parcel.new(self.address, self.weight, self.dimension, self.id)
  end
  def delete
   @@parcels.delete(self.id)
 end
end
