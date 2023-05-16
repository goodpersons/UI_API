class ApplicationController < ActionController::API
  # protect_from_forgery prepend: true, with: :exception
  include JWTSessions::RailsAuthorization
  # rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def current_user
    # 标头必须包含带有访问令牌的 Authorization: Bearer 。
    # payload 方法可用于从令牌中提取编码数据
    @current_user ||= User.find(payload["user_id"])
  end

  def not_authorized
    render json: { error: "Not authorized" }, status: :unauthorized
  end
end
