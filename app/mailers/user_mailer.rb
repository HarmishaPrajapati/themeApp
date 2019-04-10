class UserMailer < ApplicationMailer
	def welcome_email(cleaner)
    @cleaner = cleaner
    mail(to: @cleaner.email, subject: 'HomeWorker')
  end
end
