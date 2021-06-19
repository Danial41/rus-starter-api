class ProjectsController < ApplicationController

    def index
        projects = Project.all

        unless projects.empty?
            projects_serializer = projects
            render json: {status: :ok, data: projects_serializer}
        else
            render json: {status: 404, message: 'Projects were not found'}
        end
    end

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
        params.permit(:total_sum, :title, :description, :image)
    end
end
