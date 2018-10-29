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
                render json: orientador
            end

            def update
                if Advisor.exists?(name: orientador_params["name"])
                    orientador = { id: nil};
                    render json: orientador   
                else
                    orientador = Advisor.find(orientador_params["id"])
                    orientador.update(orientador_params)
                    render json: orientador
                end
            end

            def remove
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