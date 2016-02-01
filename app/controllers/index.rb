get '/' do
  @photo = Photo.all
  erb :index
end

get '/photos/show/:id' do
  @photo = Photo.find(params[:id])
  erb :"/photos/show"
end

get '/photos/new' do
  @photo = Photo.new
  erb :"/photos/new"
end

post '/photos' do
  @product = params[:products]
  @name = params[:name]
  @event = params[:event]

  @photo = Photo.new(name: @name, event: Event.find_or_create_by(name: @event), products: [Product.find_or_create_by(name: @product)]
  	)

  if @photo.save
    redirect '/'
  else
 	@errors=@photo.erros
    erb :"/photos/new"
  end
end