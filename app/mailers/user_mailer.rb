class UserMailer < ApplicationMailer
	def welcome_email(c)
    @cleaner = c
    mail(to: @cleaner.email, subject: 'HomeWorker')
    end
end
