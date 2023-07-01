class UserMailer < ApplicationMailer
    def verify_email(user)
        @user = user
        mail(
            from: 'joshua@grandeur.com',
            to: @user.email, 
            subject: 'Verify Your Email') do |format|
            format.html { render 'verify_email' }
        end
    end
end