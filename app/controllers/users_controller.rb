class UsersController < ApplicationController
 def sign_in
    login_params = params.permit(:mobile, :username)

    @user = User.find_by_mobile(login_params[:mobile])
    if @user && @user.send_passcode
      render(json: {message: 'Sent passccode'}, status: :ok)
    else
      render(json: {error: 'failed to send passcode'}, status: :unauthorized)
    end
  end

  def verify
  verification_params = params.permit(:mobile, :passcode)
  @user = User.find_by_mobile(verification_params[:mobile])
  if @user && @user.verify_passcode(verification_params[:passcode])
    render(json: {user: @user}, status: :ok)
  else
    render(json: {error: 'Failed to verify passcode'}, status: :unauthorized)
  end
  end
end
