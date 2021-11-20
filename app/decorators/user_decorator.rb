class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.user_name} "
  end
end
