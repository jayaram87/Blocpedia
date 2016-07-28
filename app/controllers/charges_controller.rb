class ChargesController < ApplicationController
    
    def new
        @amount = 15_00
        
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key]}",
            description: "Premium Membership - #{current_user.email}",
            amount: @amount
        }
    end
    
    
    def create
        @amount = 15_00
        
        customer = Stripe::Customer.create(email: current_user.email, source: params[:stripeToken])
        
        begin
            charge = Stripe::Charge.create(
                customer: customer.id, 
                amount: @amount, 
                description: "Premium Membership - #{current_user.email}", 
                currency: 'usd'
            )
        
            current_user.upgrade
        
            flash[:notice] = "Thanks for the money #{current_user.email}"
            redirect_to homepage_index_path(current_user)
        
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
        end
    
    end
    
    def downgrade_user
        current_user.downgrade
        redirect_to homepage_index_path(current_user)
    end
end
