ActiveAdmin.register User, as: "User" do

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
  
  permit_params :list, :of, :attributes, :on, :users, :first_name, :last_name, :email, :password ,:verified, :is_blocked
  # permit_params :fi :verified, :is_blocked

  actions :all, except: [:new]

  # Enable batch delete action
  # batch_action :destroy, confirm: "Are you sure you want to delete these items?"


  # member_action :delete, method: :delete do
  #   # Find the record by ID
  #   record = User.find(params[:id])

  #   # Delete the record
  #   record.destroy

  #   # Redirect to the index page with a success message
  #   redirect_to admin_user_path, notice: 'Record deleted successfully'
  # end

  # action_item :delete, only: :show do
  #   link_to 'Delete', admin_user_delete_path(resource), method: :delete, data: { confirm: 'Are you sure you want to delete this record?' }
  # end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :verified
    column :is_blocked
    actions :defaults => true
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :verified
      row :is_blocked
    end
  end


  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :verified
      f.input :is_blocked
    end
    f.actions
  end


  filter :first_name
  filter :last_name
  filter :email
  filter :verified
  filter :is_blocked
end
