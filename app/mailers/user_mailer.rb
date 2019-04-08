class UserMailer < ApplicationMailer
	def welcome_email(cleaner)
		@cleaner = cleaner
    mail(to: @cleaner.email, subject: 'Welcome to HomeWorker Site')
    end
end
