class ApplicationController < ActionController::Base
	private def current_manager
		Manager.find_by(login_id:session[:login_id]) if session[:login_id]
	end
	helper_method:current_manager
end
