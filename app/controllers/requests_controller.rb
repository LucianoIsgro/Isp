class RequestsController < ApplicationController

    before_action :set_client, only:[:create, :update]
    before_action :set_request, only: [:show, :update, :destroy]
    
    
    def set_client
        @client = Client.find_by(token: request.headers["Authorization"].to_s) 
        return if @client.present?
        respond_to do |format|
          format.json { render status: 401}
        end     
      end  
    
    

    def rejected
        respond_to do |format|
            format.json { render status: 200, json: Request.all.where(estado: :rechazada) }
        end

    end
    def index
        respond_to do |format|
            format.json { render status: 200, json: Request.all }
        end
    end

    def show
        respond_to do |format|
            format.json { render status: 200, json: @request }
        end
    end
    
    def create
    
        @request = Request.new(request_params) #Yo creo que hay que crear la request con la id del plan que el cliente quiere, es decir cuando se crea la request se pone la id del plan en el body
        @request.client = @client
        respond_to do |format|
            if @request.save
                format.json { render status: 200, json: @request}
            else
                format.json { render status: 400, json: {message: @request.errors.full_messages}}
            end
        end
    
    end


    def update
        respond_to do |format|
            if @request.update(request_params)
                format.json { render status: 200, json: @request}
            else
                format.json { render status: 400, json: {message: @request.errors.full_messages}}
            end
        end
    end

    def destroy
        respond_to do |format|
            if @request.destroy
                format.json { render status: 200, json: @request}
            else
                format.json { render status: 400, json: {message: @request.errors.full_messages}}
            end
        end
    end
    

    private

    def set_request
        @request = Request.find(params[:id])
        
        return if @request.present?
        
        respond_to do |format|
            format.json { render status: 400, json: :no_exist }
        end

    end

    

    def request_params
        params.permit(:estado,:plan_id)
    
    end







end
