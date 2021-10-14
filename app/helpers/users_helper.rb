module UsersHelper
  def user_role
    if current_user.CustomerSupport?
      'Customer Support'
    elsif current_user.SuperAdmin?
      'Super Admin'
    elsif current_user.Admin?
      'Admin'
    elsif current_user.Designers?
      'Designers'
    end
  end
end
