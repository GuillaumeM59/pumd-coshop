class ContactMailer < ApplicationMailer

  default from: 'contact@co-shop.fr'

  def contact_email(message)
    @message = message
    @url  = 'coshop.fr'
    mail(from: @message.email, to:'projetcoshop@gmail.com', subject: "Une question vous a été posé sur le site par #{@message.prenom} ")
  end

end
