module Api
	module V1
        class ContasController < ApplicationController

            def index
                contas = Conta.all.order(:id);
                # contas = Conta.find(2);
				render json: contas
            end

            def find
				conta = Conta.exists?(params[:id]) ? Conta.find(params[:id]) : {};
				render json: conta
            end
            
            def save
				conta = Conta.create(contas_params)
				render json: conta
            end

            def update
                if Conta.exists?(codigo: contas_params["codigo"])
                    render json: { error: :locked, message: 'Já existe conta com esse código'}, status: 400   
                else
                    conta = Conta.find(contas_params["id"])
				    conta.update(contas_params)
                    render json: conta
                end
				
            end

            def remove
                lancamento = Lancamento.where("conta_credito = "+params[:id]+" or conta_debito = "+params[:id]).exists?;
                if lancamento 
                    render json: { error: :locked, message: 'Conta tem Lançamentos' }, status: 400
                else
                    conta = Conta.find(params[:id]).destroy;
                    render json: conta
                end
            end
            
            private
			def contas_params
				params.permit(:id, :natureza, :descricao, :codigo, :classificacao)
			end
			
        end
    end
end