class JobsController < ApplicationController
  before_action :redirect_if_not_logged_in
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @job = @user.jobs.build
        else
        @job = Job.new
        end
        @job.build_category 
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @jobss = @user.jobss.alpha
     else
       @error = "That user doesn't exist" if params[:user_id]
       @jobs = Job.alpha.includes(:category, :user)
     end
 
     @jobs = @jobs.search(params[:q].downcase) if params[:q] && !params[:q].empty?
     @jobs = @jobs.filter(params[:job][:category_id]) if params[:job] && params[:job][:category_id] != ""
 
   end

    def create
        @job = current_user.jobs.create(job_params)
        if @job.save
        redirect_to jobs_path
        else
         render :new
        end
    end 


    def edit
        @job = Job.find_by_id(params[:id])
        redirect_to jobs_path if !@job || @job.user != current_user
        @job.build_category if !@job.category
      end
    
      def update
         @job = Job.find_by(id: params[:id])
         redirect_to jobs_path if !@job || @job.user != current_user
        if @job.update(job_params)
          redirect_to job_path(@job)
        else
          render :edit
        end
      end

      


    

    def show 
        
        @job = Job.find_by_is(params[:id])
        redirect_to jobs_path if !@job
    end

    private

    def job_params
        params.require(:job).permit(:first_name, :last_name, :phone_number, :busness_email, :title, :description, :category_id, category_attributes: [:name])
    end
end
