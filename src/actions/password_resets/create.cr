class PasswordResets::Create < BrowserAction
  include Auth::PasswordResets::Base
  include Auth::PasswordResets::TokenFromSession

  post "/password_resets/:user_id" do
    ResetPassword.update(user, params) do |operation, user|
      if operation.saved?
        session.delete(:password_reset_token)
        sign_in user
        flash.success = "Your password has been reset"
        redirect to: Groups::Index
      else
        html NewPage, reset_password: operation, user_id: user_id.to_i
      end
    end
  end
end
