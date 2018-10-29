module Api
	module V1
		class StudentsController < ApplicationController
      			
			# Listar todos os artigos
            def mostrar
                # Student.all
				students = Student.limit(10);
				render json: students
			end
           
            def find
                student = Student.exists?(params[:id]) ? Student.find(params[:id]) : {};
                advisor = Advisor.exists?(student.advisor_id) ? Advisor.find(student.advisor_id) : {};
                student = student.as_json.merge(:orientador => advisor);
                render json: student
            end
            
            def exibe_dados_completos
                estudantes = [];
                Student.all.each { |student| 
                    advisor = Advisor.exists?(student.advisor_id) ? Advisor.find(student.advisor_id) : {};
                    student = student.as_json.merge(:orientador => advisor);
                    estudantes << student;
                }
                render :json => estudantes
            end

            def update
                student = Student.find(student_params["id"])
                student.update(student_params)
                render json: Student.find(student_params["id"])
            end

                  
            def save
			    student = Student.create(student_params)
				render json: student
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