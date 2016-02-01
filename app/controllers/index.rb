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
  @photo = Photo.new(params[:photo])
  if @photo.save
    redirect '/'
  else
    erb :"/photos/new"
  end
end