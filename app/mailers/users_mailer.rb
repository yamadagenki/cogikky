class UsersMailer < ApplicationMailer
  default from: 'from@example.com'

  def send_giving
    mail to: 'sample@gmail.com', subject: '恵みを受けました。すぐ連絡して、感謝しましょう。'
  end
end
