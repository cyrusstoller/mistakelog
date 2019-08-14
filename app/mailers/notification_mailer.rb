class NotificationMailer < ApplicationMailer
  def reminder
    @user = params[:user]
    @mistakes = @user.mistakes.incomplete.overdue

    unless @mistakes.empty?
      mail to: @user.email, from: 'Mistake Log <no-reply@mistakelog.com>', subject: 'Mistake Log Reminder' do |format|
        format.html
        format.text
      end
    end
  end
end
