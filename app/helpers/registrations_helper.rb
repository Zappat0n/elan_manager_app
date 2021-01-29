module RegistrationsHelper
  def registration_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
