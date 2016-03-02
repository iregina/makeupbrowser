class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.ethnicity = Ethnicity.new
    respond_with self.resource
  end

	def create
		super
		ethnicity = resource.ethnicity
	end

  private

  def sign_up_params
 		allow = [:first_name, :last_name, :email, :password, :password_confirmation, [ethnicity_attributes: [:name]] ]
    params.require(:user).permit(allow)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, ethnicity: [:name])
  end
end