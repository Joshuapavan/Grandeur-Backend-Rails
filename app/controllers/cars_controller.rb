class CarsController < BaseController

    before_action :check_is_blocked, only: [:create]

    def index
        @cars = Car.order(created_at: :desc)
        if @cars.empty?
            render json: {
                message: "no cars found",
                cars: []
            }, status: :not_found
        else
            render json: {
                message: "cars found",
                cars: CarSerializer.new(@cars)
            }, status: :ok
        end
    end


    def create 
        user = User.find_by(email: params[:email])
        
        if user.present? 
        if user.verified
            car = user.cars.build(car_params)  # Associate the car with the user
            if car.save
            render json: {
                message: "Car created"
            }, status: :ok 
            else
            render json: {
                message: "Car not created",
                errors: car.errors.full_messages
            }, status: :unprocessable_entity
            end
        else
            render json: {
            message: "User is not verified"
            }, status: :unauthorized
        end
        else
        render json: {
            message: "User is not present"
        }, status: :unauthorized
        end
    end     

    def search
        cars = Car.where("lower(name) LIKE ? OR lower(brand) LIKE ? OR lower(model) LIKE ?", 
        "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
        if cars.empty?
            render json: {
                message: "no cars found",
                cars: []
            }, status: :not_found
        else
            render json: {
                message: "cars found",
                cars: CarSerializer.new(cars)
            }, status: :ok
        end
    end

    def destroy
        Car.destroy_all
        render json: {
            message: "All cars deleted"
        }, status: :ok
    end


    private

    def car_params
        params.permit(:name, :email, :brand, :model, :car_number, :year_of_manufacture, :kms_driven, :price, :any_damages, :type_of_car, :no_of_owners, :insured, :image)
    end

    def check_is_blocked
        user = User.find_by(email: params[:email])
        if user.is_blocked
            render json: {
                message: "User is blocked, please contact admin"
            }, status: :unauthorized
        end
    end

end
