class ApplicationMailer < ActionMailer::Base
  default from: 'taichi217niina@gmail.com'
  
  def send_when_admin_reply(user, contact)
  @user = user #ユーザー情報
  @answer = contact #返信内容
  mail to: user.email, subject: '【EPM】お問い合わせありがとうございます'
  end
end
