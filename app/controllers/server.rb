

# Handle GET-request (Show the upload form)
get "/upload" do
  @photo = Photo.new
  haml :'photos/upload'
end      
    
# Handle POST-request (Receive and save the uploaded file)
post "/upload" do 

  @product = params[:products]
  @name = params[:name]
  @event = params[:event]

  @photo = Photo.new(name: @name, event: Event.find_or_create_by(name: @event), products: [Product.find_or_create_by(name: @product)]
  	)

  if @photo.save
  	File.open('public/imgs/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  	end
    erb :index
  else
    haml :"/photos/upload"
  end

  # return "The file was successfully uploaded!"
end
