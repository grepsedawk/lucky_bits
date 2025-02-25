require "../spec_helper"

describe "Reset password flow" do
  it "works" do
    user = UserFactory.create
    flow = ResetPasswordFlow.new(user)

    flow.request_password_reset
    flow.should_have_sent_reset_email
    flow.reset_password("new-password")
    flow.should_be_signed_in
    flow.sign_out
    flow.sign_in(password: "wrong-password")
    flow.should_have_password_error
    flow.sign_in(password: "new-password")
    flow.should_be_signed_in
  end
end
