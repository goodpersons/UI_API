class SignupController < ApplicationController
  def create
    # 注册
    user = User.new(signin_params)
    if user.save()
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      # binding.irb
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join(' ')}, status: :unprocessable_entity
    end
  end


  private

  def signin_params
    # .require(:user)  ActionController::ParameterMissing: param is missing or the value is empty: user
    params.permit(:eamil,
                  :password,
                  :password_confirmation
                  )
  end
end
