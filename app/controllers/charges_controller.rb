class ChargesController < ApplicationController
    
    def new
        @amount = 00_01
        
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key]}",
            description: "Premium Membership - #{current_user.email}",
            amount: @amount
        }
    end
    
    
    def create
        @amount = 00_01
        
        customer = Stripe::Customer.create(email: current_user.email, source: params[:stripeToken])
        
        charge = Stripe::Charge.create(
            customer: customer.id, 
            amount: @amount, 
            description: "Premium Membership - #{current_user.email}", 
            currency: 'usd'
        )
        
        current_user.update(role: "premium")
        
        flash[:notice] = "Thanks for the money #{current_user.email}"
        redirect_to user_path(current_user)
        
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
            
        respond_to do |format|
            format.html
            format.js
        end    
    end
end
