class ContactMailer < ApplicationMailer

  default from: 'contact@co-shop.fr'

  def contact_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to:'projetcoshop@gmail.com', subject: 'Une question vous a été posé sur le site')
  end

end
