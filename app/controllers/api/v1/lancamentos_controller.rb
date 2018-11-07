module Api
	module V1
		class LancamentosController < ApplicationController
      			
			def index
				# lancamentos = Lancamento.all;
				lancamentos = Lancamento.all
				render json: lancamentos
			end
			
			# def update
            #     student = Student.find(lancamentos_params["id"]).update(lancamentos_params)
            #     render json: Student.find(lancamentos_params["id"])
            # end
                  
            def save
				lancamento = Lancamento.create(lancamentos_params)
				render json: lancamento
            end
            
            
            # def remove
            #     student = Student.find(params[:id]).destroy;
            #     render json: student
            # end


			private
			def lancamentos_params
				params.permit(:id, :conta_credito, :conta_debito, :valor, :historico)
			end

			## conta_debito
        end
    end
end