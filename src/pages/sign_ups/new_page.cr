class SignUps::NewPage < GuestLayout
  needs operation : SignUpUser

  private def page_title
    "Sign Up"
  end

  def content
    h1 "Sign Up"
    render_sign_up_form(operation)
  end

  private def render_sign_up_form(f)
    form_for SignUps::Create do
      sign_up_fields(f)
      submit "Sign Up", flow_id: "sign-up-button"
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(f)
    field(f.username) { |i| text_input i, autofocus: "true" }
    field(f.email) { |i| email_input i }
    field(f.password) { |i| password_input i }
    field(f.password_confirmation) { |i| password_input i }
  end
end
