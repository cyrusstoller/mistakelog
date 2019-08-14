# Preview all emails at http://localhost:5000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def reminder
    user = User.find_by(email: params[:email]) || User.first
    NotificationMailer.with(user: user).reminder
  end
end
