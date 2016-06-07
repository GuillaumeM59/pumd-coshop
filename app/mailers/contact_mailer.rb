class ContactMailer < ApplicationMailer


  default from: 'contact@co-shop.fr'

  def contact_email(message)
    @message = message
    @url  = 'coshop.fr'
    mail(from: @message.email, to:'projetcoshop@gmail.com', subject: "Une question vous a été posé sur le site par #{@message.prenom} ")
  end
  def reservationP_email(current_user,bid)
    @bid = bid
    @current_user = current_user
    @url  = 'coshop.fr'
    mail(from:'reservation@co-shop.fr', to: current_user.email, subject: "co-shop.fr: Nouvelle Réservation de #{current_user.prenom} ")
  end
  def annulresaP_email(current_user,bid)
    @current_user = current_user
    @bid = bid
    @url  = 'coshop.fr'
    mail(from:'reservation@co-shop.fr', to:current_user.email, subject: "co-shop.fr: Annulation de la réservation de #{current_user.prenom} ")
  end
  def reservation_email(current_user,bid)
    @current_user = current_user
    @bid = bid
    @url  = 'coshop.fr'
    mail(from:'reservation@co-shop.fr', to: User.find(bid.driver_id).email, subject: "co-shop.fr: Nouvelle Réservation de #{current_user.prenom} ")
  end
  def annulresa_email(current_user, bid)
    @current_user = current_user
    @bid = bid
    @url  = 'coshop.fr'
    mail(from:'reservation@co-shop.fr', to:User.find(bid.driver_id).email, subject: "co-shop.fr: Annulation de la réservation de #{current_user.prenom} ")
  end

end
