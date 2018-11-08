module Api
	module V1
		class LancamentosController < ApplicationController
      			
			def index
				# lancamentos = Lancamento.all;
				lancamentos = [];
				Lancamento.all.each { |lancamento|
					lancamento = lancamento.as_json.merge(:conta_credito => lancamento.contas_credito, :conta_debito => lancamento.contas_debito);		
					lancamentos << lancamento
				}
				render json: lancamentos
			end

			def find
				lancamento = Lancamento.exists?(params[:id]) ? Lancamento.find(params[:id]) : {};
				lancamento = lancamento.as_json.merge(:conta_credito => lancamento.contas_credito, :conta_debito => lancamento.contas_debito);
				render json: lancamento
			end
			                 
            def save
				lancamento = Lancamento.create(lancamentos_params)
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
				params.permit(:id, :conta_credito, :conta_debito, :valor, :historico, :data)
			end
        end
    end
end