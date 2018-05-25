if Rails.env.development? || Rails.env.production?
ActionMailer::Base.layout 'mailer'
ActionMailer::Base.default from: "from@example.com"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:        'smtp.sendgrid.net',
  port:           '2525',
  authentication: :plain,
  user_name:      ENV['SENDGRID_USERNAME'],
  password:       ENV['SENDGRID_PASSWORD'],
  domain:          "sendgrid.com",
  enable_starttls_auto: true
}
