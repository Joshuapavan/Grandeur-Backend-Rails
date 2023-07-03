ActiveAdmin.register Car do
  permit_params :name, :email, :brand, :model, :car_number, :year_of_manufacture, :kms_driven, :price, :any_damages, :type_of_car, :no_of_owners, :insured, :user_id

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :brand
    column :model
    column :car_number
    column :year_of_manufacture
    column :kms_driven
    column :price
    column :any_damages
    column :type_of_car
    column :no_of_owners
    column :insured
    column :user_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :brand
      f.input :model
      f.input :car_number
      f.input :year_of_manufacture
      f.input :kms_driven
      f.input :price
      f.input :any_damages
      f.input :type_of_car
      f.input :no_of_owners
      f.input :insured
      f.input :user_id
    end
    f.actions
  end

  filter :name
  filter :email
  filter :brand
  filter :model
  filter :car_number
  filter :year_of_manufacture
  filter :kms_driven
  filter :price
  filter :any_damages
  filter :type_of_car
  filter :no_of_owners
  filter :insured

  # Delete action for individual car records
  action_item :destroy, only: :show do
    link_to 'Delete', resource_path(resource), method: :delete, data: { confirm: 'Are you sure?' }
  end

  member_action :destroy, method: :delete do
    resource.destroy
    redirect_to admin_cars_path, notice: 'Car was successfully deleted.'
  end

  # Batch action for deleting multiple cars
  batch_action :destroy, confirm: 'Are you sure you want to delete these cars?' do |ids|
    Car.where(id: ids).destroy_all
    redirect_to admin_cars_path, notice: 'Selected cars were successfully deleted.'
  end
end
