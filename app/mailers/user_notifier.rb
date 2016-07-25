class UserNotifier < ApplicationMailer
  default :from => 'gif_generator@example.com'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
          :subject => 'Thanks for signing up for GifGenerator!')
  end
end
