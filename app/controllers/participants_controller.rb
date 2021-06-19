class ParticipantsController < ApplicationController
    def join_team
        project = Project.find(params[:id])
        participant = project.participants.create(user: @user)

        if participant.valid?
            participant_serializer = parse_json participant
            render json: {status: :ok, message: 'The application was successfully sent', data: participant_serializer}
        else
            render json: {status: 404, message: participant.errors.full_messages}
        end
    end

    def update
        participant = Participant.find(params[:id])
        participant.update(participant_params)

        if participant.valid?
            participant_serializer = parse_json participant
            render json: {status: :ok, message: 'Participant was updated', data: participant_serializer}
        else
            render json: {status: 404, message: participant.errors.full_messages}
        end
    end

    private

    def participant_params
        params.permit(:status, :id)
    end
end
