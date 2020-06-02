class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@example.com'
  layout 'mailer'
end
#開発環境の場合　http://localhost:3000/rails/mailers/user_mailer
