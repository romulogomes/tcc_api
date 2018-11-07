module Api
	module V1
        class AdvisorsController < ApplicationController
           
            def index
                orientadores = Advisor.all;
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

            def save_all
                orientadores = params[:_json]
                orientadores.map{ |orientador| 
                    params.permit!
                    Advisor.create(orientador)
                }
                render json: orientadores
            end

            def update
                orientador = Advisor.find(orientador_params["id"]).update(orientador_params)
				render json: orientador = Advisor.find(orientador_params["id"])
            end

            def remove
                student = Student.where("advisor_id = "+params[:id]).exists?;
                if student 
                    render json: {
                        status: 400,
                        error: :locked,
                        message: 'Orientador tem filhos'
                        }, status: 400
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