require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcels.rb')

get('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcels') do
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/parcels/new') do
  erb(:new_parcel)
end

get ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

post ('/parcels') do
  address = params[:parcel_address]
  weight = params[:parcel_weight]
  dimensions = params[:parcel_dimensions]
  parcel = Parcel.new(address, weight, dimensions, nil)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get ('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:address])
  @parcels = Parcel.all
  erb(:parcels)
end

delete ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end

get ('/custom_route') do
  erb(:custom_route)
end
