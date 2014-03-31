class RegistrationController < ApplicationController
  protect_from_forgery
  def new
    @user = User.new
  end
  
  def create
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#{params.inspect}"
    @user = User.create(user_params)
    respond_to do |format|
    if @user.save
        format.html {flash[:notice] = 'Game was successfully updated.'
        redirect_to root_url}
        format.json {render :json => {:message => @user}}
        format.xml {render :xml => {:message => "Successfully Registerd"}}
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @user.errors.to_xml, :status => 400 }
      format.json { render :json => @user.errors.to_json, :status => 400 }
  end
    end

    end
# curl -X POST -d "first_name=Yogesh&last_name=Waghmare&email=yogesh@gmail.com&password=123&password_confirmation=123" http://192.168.1.38:3000/registrations/create.json
  private

  def user_params
    params.require(:user).permit(:id ,:first_name, :last_name, :email,:password_hash, :password_salt, :password,:password_confirmation)
  end
end
