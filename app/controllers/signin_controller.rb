class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  def create
    user = User.find_by!(eamil: params[:eamil])

    if user.present? && user.authenticate(params[:password])
      payload = { user_id: user.id }
      # binding.irb
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: "wrong password" }, status: :unauthorized
      # render json: { error: "Not authorized" }, status: :Unauthorized
    end
    # 捕获异常错误，防止报错 ， 当可重复使用 时候 可以使用 rescue_from ActiveRecord::RecordNotFound, with:XXX
  rescue ActiveRecord::RecordNotFound => exception
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def destory
    # 出了些问题 暂时为解决！
    binding.irb
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end
end
