class UsersController < BaseController
    before_action :check_is_bllcked, only: [:login]
    def create
        user = User.new(user_params)
        if user.save
            UserMailer.verify_email(user).deliver_now
            render json: {
                message: 'User created. Please check your email to verify your account.',
                # data: {
                    first_name: user.first_name,
                    email: user.email,
                    token: user.verification_token,
                    status: user.verified
                # }
                }, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def destroy
        user = User.find_by(id: params[:id])
        if user.destroy
            render json: { message: 'User deleted successfully.' }, status: :ok
        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def verify_email
        user = User.find_by(verification_token: params[:token])
        if user
            user.mark_as_verified!
            # render json: { message: 'Email verified successfully.' }, status: :success
        else
            render json: { error: 'Invalid verification token.' }, status: :unprocessable_entity
        end
    end

    def login
        user = User.find_by(email: params[:email])
        if user.password == params[:password]
            render json:{
                message: "logged in successfully",
                # data: {
                    first_name: user.first_name,
                    email: user.email,
                    token: user.verification_token,
                    status: user.verified
                # }
            }, status: :ok
        else
            render json: {
                message: "invalid username/password",
            }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password)
    end

    def check_is_bllcked
        user = User.find_by(email: params[:email])
        if user.is_blocked
            render json: {
                message: "User is blocked, please contact admin"
            }, status: :unauthorized
        end
    end
end