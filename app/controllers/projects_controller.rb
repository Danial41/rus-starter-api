class ProjectsController < ApplicationController

    def create
        project = @user.projects.build(project_params)

        if project.valid?
            project.save
            project_serializer = parse_json project
            render json: {status: :ok, data: project_serializer}
        else
            render json: {status: 404, message: project.errors.full_messages}
        end
    end

    private

    def project_params
        params.permit(:total_sum, :title, :description)
    end
end
