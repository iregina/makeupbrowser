class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  

  def index
    if (params[:occasion] && Occasion.all.collect(&:name).include?(params[:occasion][:name]))
      # p "***************************"
      # p occa = (params[:occasion][:name])
      # p o = Occasion.where(name: occa )
      # p id = o[0].id
      # @id = Occasion.where(name: (params[:occasion][:name]) ).id
      # p @id
      @images = Image.where(occasion_id: id)
      # p @images
      # p "***************************"
    else
      @images = Image.all.order("created_at DESC")
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find_by(id: params[:id])
  end

  # GET /images/new
  def new
    @image = current_user.images.build
    @user = current_user
    @image.occasion = Occasion.new
    # @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = current_user.images.build(image_params)
    p "******************************************"
    p @image.image.url
    p "******************************************"
    # respond_to do |format|
      if @image.save
        redirect_to @image, notice: 'image was successfully created.'
      else
        render :new
      # if @image.save
      #   format.html { redirect_to @image, notice: 'image was successfully created.' }
      #   format.json { render :show, status: :created, location: @image }
      # else
      #   format.html { render :new }
      #   format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update


    # respond_to do |format|
    if @image.update(image_params)
      redirect_to @image, notice: 'image was successfully updated.'
    else
      render :edit
    end
      # if @image.update(image_params)
      #   format.html { redirect_to @image, notice: 'image was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @image }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @image.errors, status: :unprocessable_entity }
      # end
  end


  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    redirect_to images_url
    # respond_to do |format|
    #   format.html { redirect_to images_url, notice: 'image was successfully destroyed.' }
    #   format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find_by(id: params[:id])
    end

    def correct_user
      @image = current_user.images.find_by(id: params[:id])
      redirect_to images_path, notice: "Not authorized to edit this image" if @image.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:description, :image, :occasion_id, :user)
    end
end
