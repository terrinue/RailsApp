class SessionsController < ApplicationController
	def create
		member=Member.find_by(name:params[:id])

#		if member.nil? then
#			logger.debug("if文の中に入りました")
#			logger.debug(name:params[:id])
#			logger.debug(name:params[:password])
#		end

#		if !member.nil? then
#			logger.debug("if文の中に入りました。2つ")
#			logger.debug(name:params[:id])
#			logger.debug(password:params[:password])
#			logger.debug(member.authenticate(pass:params[:password]))
#		end

		if !member.nil? && member.authenticate(params[:password])
			session[:member_id]=member.id
			redirect_to :books
		else
#			flash.alert="名前とパスワードが一致しません"
			flash[:alert]="名前とパスワードが一致しません"
			redirect_to root_path
		end
	end

	def destroy
			logger.debug("destoroyに入りました")
		session.delete(:member_id)
		redirect_to :root
	end
end
