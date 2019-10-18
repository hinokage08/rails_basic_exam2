class WebsiteMailer < ApplicationMailer
  def website_mail(website)
    @website = website

    mail to: @website.user.email, subject: "お問い合わせの確認メール"
  end
end
