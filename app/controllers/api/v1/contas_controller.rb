module Api
	module V1
        class ContasController < ApplicationController

            def index
                contas = Conta.all;
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
				conta = Conta.find(contas_params["id"])
				conta.update(contas_params)
                render json: conta
            end

            def remove
                conta = Conta.find(params[:id]).destroy;
                render json: conta
            end
            
            private
			def contas_params
				params.permit(:id, :natureza, :descricao, :codigo, :classificacao)
			end
			
        end
    end
end