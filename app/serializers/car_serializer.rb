class CarSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :brand, :model, :car_number, :year_of_manufacture, :kms_driven, :price, :any_damages, :type_of_car, :no_of_owners, :insured

  attribute :image do |object|
    if object.image.present?
      host = Rails.env.development? ? 'http://localhost:3000' : ENV['BASE_URL']
      host + Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
    else
      ''
    end
  end
end

