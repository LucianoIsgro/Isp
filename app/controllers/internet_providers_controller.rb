class InternetProvidersController < ApplicationController

    before_action :set_internet_provider, only: [:show, :update, :destroy]
    
    def index
        respond_to do |format|
            format.json { render status: 200, json: InternetProvider.all }
        end
    end

    def show
        respond_to do |format|
            format.json { render status: 200, json: @internet_provider }
        end
    end

    def create
    
        @internet_provider = InternetProvider.create(internet_provider_params)
        respond_to do |format|
            if @internet_provider.errors.blank?
                format.json { render status: 200, json: @internet_provider}
            else
                format.json { render status: 400, json: {message: @internet_provider.errors.full_messages}}
            end
        end
    
    end


    def update
        respond_to do |format|
            if @internet_provider.update(internet_provider_params)
                format.json { render status: 200, json: @internet_provider}
            else
                format.json { render status: 400, json: {message: @internet_provider.errors.full_messages}}
            end
        end
    end

    def destroy
        respond_to do |format|
            if @internet_provider.destroy
                format.json { render status: 200, json: @internet_provider}
            else
                format.json { render status: 400, json: {message: @internet_provider.errors.full_messages}}
            end
        end
    end
    






    private

    def set_internet_provider
        @internet_provider = InternetProvider.find(params[:id])
        
        return if @internet_provider.present?
        
        respond_to do |format|
            format.json { render status: 400, json: :no_exist }
        end

    end

    

    def internet_provider_params
        params.permit(:name,:token)
    
    end

   




end
