ActiveAdmin.register User do
  permit_params :verified, :is_blocked, :_destroy

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :verified
    column :is_blocked
    actions
  end
  
  batch_action :destroy, confirm: 'Are you sure you want to delete these users?' do |ids|
    User.where(id: ids).destroy_all
    redirect_to admin_users_path, notice: 'Selected users were successfully deleted.'
  end
  

  actions :all, except: [:destroy] 

  # Add the `destroy` action explicitly
  action_item :destroy, only: :show do
    link_to 'Delete', resource_path(resource), method: :delete, data: { confirm: 'Are you sure?' }
  end

  member_action :destroy, method: :delete do
    resource.destroy
    redirect_to admin_users_path, notice: 'User was successfully deleted.'
  end


  filter :first_name
  filter :last_name
  filter :email
  filter :verified
  filter :is_blocked
end
