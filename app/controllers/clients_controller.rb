class ClientsController < ApplicationController


    before_action :set_client, only: [:show, :update, :destroy, :plans]

    
    def index
        respond_to do |format|
            format.json { render status: 200, json: Client.all }
        end
    end

    def show
        respond_to do |format|
            format.json { render status: 200, json: @client }
        end
    end

    def create
    
        @client= Client.create(client_params)
        respond_to do |format|
            if @client.errors.blank?
                format.json { render status: 200, json: @client}
            else
                format.json { render status: 400, json: {message: @client.errors.full_messages}}
            end
        end
    
    end


    def update
        respond_to do |format|
            if @client.update(client_params)
                format.json { render status: 200, json: @client}
            else
                format.json { render status: 400, json: {message: @client.errors.full_messages}}
            end
        end
    end

    def destroy
        respond_to do |format|
            if @client.destroy
                format.json { render status: 200, json: @client}
            else
                format.json { render status: 400, json: {message: @client.errors.full_messages}}
            end
        end
    end
    

    private

    def set_client
       
        @client = Client.find(params[:id])
        
        return if @client.present?
        
        respond_to do |format|
            format.json { render status: 400, json: :no_exist }
        end

    end

    

    def client_params
        params.permit(:nombre,:dni,:token)
    
    end

   



end
