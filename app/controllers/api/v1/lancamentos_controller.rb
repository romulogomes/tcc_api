module Api
	module V1
		class LancamentosController < ApplicationController
      			
			def index
				# lancamentos = Lancamento.all;
				lancamentos = Lancamento.all
				render json: lancamentos
			end

			def find
				lancamentos = Lancamento.exists?(params[:id]) ? Lancamento.find(params[:id]) : {};
				render json: lancamentos
			end
			                 
            def save
				lancamento = Lancamento.create(lancamentos_params)
				binding.pry
				render json: lancamento
			end
			
			def update
				lancamento = Lancamento.find(lancamentos_params["id"])
				lancamento.update(lancamentos_params)
                render json: lancamento
            end
                      
            def remove
                lancamento = Lancamento.find(params[:id]).destroy;
                render json: lancamento
            end

			private
			def lancamentos_params
				params.permit(:id, :conta_credito, :conta_debito, :valor, :historico)
			end
        end
    end
end