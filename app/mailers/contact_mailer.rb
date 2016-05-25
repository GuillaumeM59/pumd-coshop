class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact(contact)
    @contact = contact
    @item = @contact.item
    mail to: @item.user.email,
    subject: "New contact for #{@item.name}"
  end
end
