class SessionsController < ApplicationController
	def new
	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to(session[:intended_url] || user) #change user to rooth_path
    		session[:intended_url] = nil
			if !cookies['non_data_user'].present?
				cookies['non_data_user'] = 'true'
			end
		else
			flash.now[:error] = ['Email or Password invalid, please try again.']
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
