# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@ongiddy.com'
  layout 'mailer'
end
