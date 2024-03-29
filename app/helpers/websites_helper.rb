module WebsitesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_websites_path
    elsif action_name == 'edit'
      website_path
    end
  end
end

def current_user_website?(website)
  website.user == current_user
end
