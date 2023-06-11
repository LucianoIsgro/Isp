
class PlansController < ApplicationController
    before_action :set_isp, only:[:create, :update, :destroy]
    
    before_action :set_plan, only: [:show, :update, :destroy]



    def set_isp
      @provider = InternetProvider.find_by(token: request.headers["Authorization"].to_s) 
      return if @provider.present?
      respond_to do |format|
        format.json { render status: 401}
      end     
    end  

    

   

    def index
        respond_to do |format|
            format.json { render status: 200, json: Plan.all.order("internet_provider_id") } 
        end
    end

    def show
        respond_to do |format|
            format.json { render status: 200, json: @plan }
        end
    end

    def create
      @plan = Plan.new(plan_params)
      @plan.internet_provider = @provider
      respond_to do |format|
        if @plan.save 
          format.json { render status: 200, json: @plan}
        else
          format.json { render status: 400, json: {message: @plan.errors.full_messages}}
        end
       end
    end


    def update
        
        respond_to do |format|
            
            if @plan.update(plan_params)
                format.json { render status: 200, json: @plan}
            else
                format.json { render status: 400, json: {message: @plan.errors.full_messages}}
            end

        end
    end

    def destroy
        respond_to do |format|

     
            if @plan.destroy
                format.json { render status: 200, json: @plan}
            else
                format.json { render status: 400, json: {message: @plan.errors.full_messages}}
            end


        end
    end
    
    private

    def set_plan
        @plan = Plan.find(params[:id])
        
        return if @plan.present?
        
        respond_to do |format|
            format.json { render status: 400, json: :no_exist }
        end

    end



    def plan_params
        params.permit(:nombre, :descripcion)
        
    end    







end
