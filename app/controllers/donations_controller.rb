class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    paymentIntent = Stripe::PaymentIntent.create({
      amount: donation_params["contribution"].gsub(".","").to_i,
      currency: 'eur',
      automatic_payment_methods: {enabled: true},
    })
    @donation.payment_intent_id = paymentIntent.client_secret
    if @donation.save
      redirect_to donation_checkout_path(@donation)
    else
      redirect_to root_path
    end
  end

  def checkout
    @donation = Donation.find_by(id: params[:id])
  end

  def place_order
    if current_user
      # @donation = Donation.new(donation_params)
      @donation.user = current_user

      customer = Stripe::Customer.create({
        :email => current_user.email,
        :source => cu[:stripeToken]
      })

      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'Description of your product',
        :currency => 'usd'
      })

      # rescue Stripe::CardError => e
      #   flash[:error] = e.message
      #   redirect_to new_payment_path
      # end


      # if @attendee.save
      #   redirect_to event_path(@attendee) # this should lead to the message page
      # else
      #   redirect_to new_user_session_path, notice: 'You are not logged in buddy.'
      # end
    end
  end

private

def donation_params
  params.require(:donation).permit(:contribution)
end

end
