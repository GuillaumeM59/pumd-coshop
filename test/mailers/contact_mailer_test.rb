require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
<<<<<<< HEAD
  test "new_contact" do
    mail = ContactMailer.new_contact
    assert_equal "New contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

=======
  # test "the truth" do
  #   assert true
  # end
>>>>>>> 69880851463eb53519ba9115f4b8d3550b20b0f4
end
