class EmployeesController < ApplicationController

  def index
    if current_user
      @employees = current_user.employees.all
    else
      @employees = Employee.all
    end
  end

  def new
 
  end

  def create
    @employee = Employee.create({first_name: params[:first_name],
                                middle_name: params[:middle_name],
                                last_name: params[:last_name],
                                email: params[:email],
                                phone_number: params[:phone],
                                job_title: params[:job_title],
                                salary: params[:salary],
                                gender: params[:gender],
                                address: params[:address],
                                longitude: params[:longitude],
                                latitude: params[:latitude],
                                bio: params[:bio],
                                user_id: current_user.id})

    @coordinates = Geocoder.coordinates(params[:address])
    
    flash[:success] = "New Employee Created"

    redirect_to "/"
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    @employee.update({first_name: params[:first_name],
                      middle_name: params[:middle_name],
                      last_name: params[:last_name],
                      email: params[:email],
                      phone_number: params[:phone],
                      job_title: params[:job_title],
                      salary: params[:salary],
                      gender: params[:gender],
                      address: params[:address],
                      longitude: params[:longitude],
                      latitude: params[:latitude],
                      bio: params[:bio]})

    flash[:info] = "Employee Updated"

    redirect_to "/employees/#{@employee.id}"
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    flash[:danger] = "Employee Deleted"

    redirect_to '/'
  end
end
