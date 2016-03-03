class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  

  def index
    # o returns true if occasion params exists and contains the name
    o = (params[:occasion] && Occasion.all.collect(&:name).include?(params[:occasion][:name]))
    # e returns true if ethnicity params exists and contains the name in the url 
    e = (params[:ethnicity] && Ethnicity.all.collect(&:name).include?(params[:ethnicity][:name]))
    # returns all instances of Ethnicity that have the names params (should only return 1 thin)
    # ethnicity_selection = Ethnicity.where(name: (params[:ethnicity][:name]) )

    # should return id of the selected ethnicity (one id only)
    # selected_ethnicity_id = ethnicity_selection[0].id
    # finds all users who identified as that ethnicity, will return a hash
    # selected_user_ethnicity = User.where(ethnicity_id: selected_ethnicity_id)
    
    if o || e
      if (params[:ethnicity][:name]).blank?
        p "ethnicity was blank"
        # returns all instances of occasions where the names params (should only return 1 thing)
        occasion_selection = Occasion.where(name: (params[:occasion][:name]) )
        # should return the id of selected occasion (one id only)
        selected_occasion_id = occasion_selection[0].id
        
        @images = Image.where(occasion_id: selected_occasion_id)
      elsif (params[:occasion][:name]).blank?
        p "occasion is blank"
        @images = Image.all
      else
        p "ethnicity and occasion are NOT blank"
        @images = Image.all
      end
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
