class UserMailer < ApplicationMailer
 default from: "from@example.com"
 def second_fa(user)
 	@user=user
 	@token = @user.authentication_token
 	mail(to: @user.email, subject: 'Your login token')
 end
 def forget_password(user)
    @user = user
    mail(to: user.email, subject: "Password reset")
  end
end
