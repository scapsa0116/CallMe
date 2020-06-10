class JobsController < ApplicationController
  before_action :redirect_if_not_logged_in
    def new
        @job = Job.new
    end

    def create
        @job = current_user.jobs.build(job_params)
        if @job.save
        #session[:job_id] = @job.id
        redirect_to jobs_path
        else
         render :show
        end
    end 
    def index
       @jobs = Job.all
    end

    def show 
        rais.params
        @job = Job.find_by_is(params[:id])
        redirect_to jobs_path if @job
    end

    private

    def job_params
        params.require(:job).permit(:first_name, :last_name, :phone_number, :busness_email, :title, :description)
    end
end
