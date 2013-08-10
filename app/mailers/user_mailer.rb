require 'addressable/uri'

class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def activation_email(user)
    @user = user
    @activation_url = Addressable::URI.new(
       :scheme => "http",
       :host => "localhost:3000",
       :path => users_activate_path,
       :query_values => {:activation_token => user.activation_token}
     ).to_s

    mail(to: user.email, subject: "Welcome to MusicApp. Please activate your acocunt.")
  end

end


# On signup, send the user an email (via ActionMailer).
# Email should contain a link to "activate" the account. Account starts out deactivated until activation.
# In addition to password/session token, add an activation token column.
# Add a route for an action like UsersController#activate.
# In the email, send a URL to /users/activate?token=..., where this is the activation token.
# The controller should verify the token, and if accurate, activate the account.