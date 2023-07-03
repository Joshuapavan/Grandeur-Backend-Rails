ActiveAdmin.register User do

  actions :all

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :email, :password, :verified, :verification_token
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :password, :verified, :verification_token]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

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
  

  actions :all, except: [:destroy] # Remove the `except` option if it's already present

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
