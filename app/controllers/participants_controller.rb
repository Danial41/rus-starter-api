class ParticipantsController < ApplicationController

    def pending_participants
        project = Project.find(params[:id])

        pending_participants = project.participants

        unless pending_participants.empty?
            pending_participants_serializer = parse_json pending_participants
            render json: {status: :ok, data: pending_participants}
        else
            render json: {status: 404, message: 'Participants were not found'}
        end
    end

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
