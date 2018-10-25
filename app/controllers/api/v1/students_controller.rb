module Api
	module V1
		class StudentsController < ApplicationController
      			
			# Listar todos os artigos
			def mostrar
				students = Student.all;
				render json: {message:'Estudantes carregados', data:students},status: :ok
			end
 
            
            def find
                student = Student.exists?(params[:id]) ? Student.find(params[:id]) : {};
                advisor = Advisor.exists?(student.advisor_id) ? Advisor.find(student.advisor_id) : {};
                student = student.as_json.merge(:orientador => advisor);
                render json: student
            end
            

            def exibe_dados_completos
                estudantes = [];
                for student in Student.all do
                    advisor = Advisor.exists?(student.advisor_id) ? Advisor.find(student.advisor_id) : {};
                    student = student.as_json.merge(:orientador => advisor);
                    estudantes.push(student);
                end
                render :json => estudantes
            end

            def update
                student = Student.find(student_params["id"]).update(student_params)
                render json: Student.find(student_params["id"])
            end

                  
            def save
				students = Student.create(student_params)
				render json: students
            end
            
            
            def remove
                student = Student.find(params[:id]).destroy;
                render json: student
            end


			private
			def student_params
				params.permit(:id, :name, :advisor_id)
			end
		end
	end
end