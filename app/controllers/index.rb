get '/' do
  @photo = Photo.all
  erb :index
end

get '/photos/show/:id' do
  @photo = Photo.find(params[:id])
  erb :"/photos/show"
end

# this is the http method for uploading a new photo

# get '/photos/new' do
#   @photo = Photo.new
#   erb :"/photos/new"
# end

# this is the http method for posting a photo 

post '/photos' do
  @product = params[:products]
  @name = params[:name]
  @event = params[:event]

  @photo = Photo.new(name: @name, event: Event.find_or_create_by(name: @event), products: [Product.find_or_create_by(name: @product)]
  	)

  if @photo.save
    erb :index
  else
 	@errors=@photo.erros
    erb :"/photos/new"
  end
end