class SessionsController < ApplicationController
	def create
		manager=Manager.find_by(login_id:params[:id])

		if manager&.authenticate(params[:password])
			session[:login_id]=manager.login_id
		else
			flash.alert="名前とパスワードが一致しません"
		end
		redirect_to :books
	end

	def destroy
		session.delete(:login_id)
		redirect_to :root
	end
end
