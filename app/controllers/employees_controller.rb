class EmployeesController < ApplicationController
    before_action :get_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def show
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)

        if @employee.valid? then
            redirect_to employee_path(@employee)
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
    end

    def update
        @employee.update(employee_params)

        if @employee.valid? then
            redirect_to employee_path(@employee)
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to edit_path(@employee)
        end
    end

    private

    def get_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
