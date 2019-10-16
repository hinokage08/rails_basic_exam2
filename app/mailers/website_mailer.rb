class WebsiteMailer < ApplicationMailer
  def website_mail(website)
    @website = website

    mail to: "denncoru@yahoo.co.jp", subject: "お問い合わせの確認メール"
  end
end
