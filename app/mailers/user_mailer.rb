class UserMailer < ActionMailer::Base

  def send_email(data)
  	@name = data[:name]
  	@email = data[:email]
  	@feedback = data[:comment]
  	mail(:to => "sina.zargaran@hotmail.com", :subject => "Comments, Feedbacks, and Questions")
  end
end
