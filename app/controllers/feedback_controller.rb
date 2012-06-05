class FeedbackController < ApplicationController
	def create
    if not params[:email].nil?
      UserMailer.send_email(params[:email]).deliver
      redirect_to donations_path, :notice => "Successfuly submitted your feedback. Thank you!"
    end
	end
end