class ApplicationController < ActionController::Base

  def authenticated_user_or_owner?
    user_signed_in? or owner_signed_in?
  end

end
