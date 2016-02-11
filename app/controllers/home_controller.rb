class HomeController < ApplicationController
  def index
  end
  
  def login
  end
  
  def register
	@user = User.new
	@user.email = 'enter email here'
	@user.pub_key = 'Paste ASCII-Armored PGP key here'
	@user.pass_hash = 'Enter Password'
	
  end
  
  
  
  
  def registration_params 
	params.require(:user).permit(:email, :pub_key, :pass_hash)
  end
  
end
