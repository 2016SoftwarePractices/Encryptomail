class HomeController < ApplicationController
  def index
  end
  
  def login
  end
  
  def register
	@user = User.new
	@user.email = 'enter email here'
	@user.pub_key = 'Paste ASCII-Armored PGP key here'
	@user.password1 = ''
	@user.password2 = ''
	
  end
  
  def registerpost
	
	
	
  end
  
  def registration_params 
	params.require(:user).permit(:email, :pub_key, :password1, :password2)
  end
  
  
end
