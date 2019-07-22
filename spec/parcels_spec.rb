require 'rspec'
require 'parcels'

describe '#parcel' do
  before(:each) do
     parcel.clear()
   end
  describe('.all') do
    it("returns an empty array when there are no parcels") do
      expect(parcel.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an parcel") do
      parcel = parcel.new("Giant Steps", nil) # nil added as second argument
      parcel.save()
      parcel2 = parcel.new("Blue", nil) # nil added as second argument
      parcel2.save()
      expect(parcel.all).to(eq([parcel, parcel2]))
    end
  end
  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = parcel.new("Blue", nil)
      parcel2 = parcel.new("Blue", nil)
      expect(parcel).to(eq(parcel2))
    end
  end
  describe('.clear') do
    it("clears all parcels") do
      parcel = parcel.new("Giant Steps", nil)
      parcel.save()
      parcel2 = parcel.new("Blue", nil)
      parcel2.save()
      parcel.clear()
      expect(parcel.all).to(eq([]))
    end
  end
  describe('.find') do
    it("finds an parcel by id") do
      parcel = parcel.new("Giant Steps", nil)
      parcel.save()
      parcel2 = parcel.new("Blue", nil)
      parcel2.save()
      expect(parcel.find(parcel.id)).to(eq(parcel))
    end
  end
  describe('#update') do
  it("updates an parcel by id") do
    parcel = parcel.new("Giant Steps", nil)
    parcel.save()
    parcel.update("A Love Supreme")
    expect(parcel.name).to(eq("A Love Supreme"))
  end
end
describe('#delete') do
    it("deletes an parcel by id") do
      parcel = parcel.new("Giant Steps", nil)
      parcel.save()
      parcel2 = parcel.new("Blue", nil)
      parcel2.save()
      parcel.delete()
      expect(parcel.all).to(eq([parcel2]))
    end
  end

end
