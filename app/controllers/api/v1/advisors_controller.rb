module Api
	module V1
        class AdvisorsController < ApplicationController
           
            def index
                # Advisor.all
				orientadores = Advisor.limit(10);
				render json: orientadores
            end

            def find
                orientador = Advisor.exists?(params[:id]) ? Advisor.find(params[:id]) : {};
                render json: orientador
            end

            def save
                orientador = Advisor.create(orientador_params)
                # if orientador.id?
                    render json: orientador
                # else
                    # render json: orientador.errors, status: 400
                # end
            end

            def update
                orientador = Advisor.find(orientador_params["id"]).update(orientador_params)
				render json: orientador = Advisor.find(orientador_params["id"])
            end

            def remove
                # render json: {}

                student = Student.where("advisor_id = "+params[:id]).exists?;
                if student 
                    render json: { error: :locked, message: 'Orientador tem filhos' }, status: 400
                else
                    orientador = Advisor.find(params[:id]).destroy;
                    render json: orientador
                end
            end

            private
			def orientador_params
				params.permit(:id, :name, :area)
			end
            
        end
    end
end