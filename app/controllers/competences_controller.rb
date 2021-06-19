class CompetencesController < ApplicationController
    def create
        user_competences = params[:competences].map { |hash| @user.competences.create!(title: hash[:title]) }

        unless user_competences.empty?
            render json: {status: :ok, data: user_competences}
        else
            render json: {status: 404, message: 'something went wrong'}
        end

    end

    private

    def competence_params
        params.permit(competences: [:title]).require(:competences)
    end
end
