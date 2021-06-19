class ProfilesController < ApplicationController

    def update
        # profile = Profile.find(params[:id])
        profile = @user.profile.update_attributes(profile_params)

        profile_serializer = parse_json profile

        render json: {success: 'hz', data: profile_serializer}
    end

    def create
        if profile
            return update
        end

        profile = @user.create_profile(profile_params)

        if profile.valid?
            profile_serializer = parse_json profile
            render json: {status: :ok, data: profile_serializer}
        else
            render json: {status: 404, message: profile.errors.full_messages}
        end
    end

    private

    def profile_params
        params.permit(:first_name, :last_name, :patronymic, :birthday, :charachteristics)
    end
end
