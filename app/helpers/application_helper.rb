module ApplicationHelper
  def user_type(user)
    case
    when user.admin?
      "admin-card"
    when user.csr?
      "csr-card"
    end
  end
end
