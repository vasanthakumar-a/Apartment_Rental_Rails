module ApartmentsHelper

  def edit_profile
    if user_signed_in?
      edit_user_registration_path
    elsif owner_signed_in?
      edit_owner_registration_path
    else
    end
  end

  def authenticated_user_or_owner?
    user_signed_in? or owner_signed_in?
  end

  def image_attached?
    if user_signed_in?
      current_user.profile_image.attached?
    elsif owner_signed_in?
      current_owner.profile_image.attached?
    else
      false
    end
  end

  def profile_image
    if user_signed_in?
      current_user.profile_image
    elsif owner_signed_in?
      current_owner.profile_image
    else
    end
  end

  def current_credits
    if user_signed_in?
      current_user.credits
    elsif owner_signed_in?
      current_owner.credits
    else
    end
  end
end
