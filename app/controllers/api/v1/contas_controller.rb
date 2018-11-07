module Api
	module V1
        class ContasController < ApplicationController

            def index
                contas = Conta.all;
                # contas = Conta.find(2);
				render json: contas
            end
        end
    end
end