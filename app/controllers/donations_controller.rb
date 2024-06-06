class DonationsController < ApplicationController
  def create
    if current_user
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
    else
      redirect_to new_user_session_path, notice: 'You are not logged in buddy.'
    end
  end

  def checkout
    @donation = Donation.find_by(id: params[:id])
  end

  def success
    @donation = Donation.find_by(id: params[:id])
    paymentIntent = Stripe::PaymentIntent.retrieve(@donation.payment_intent_id.split("_secret")[0])
    @donation.status = paymentIntent.status
    @donation.save

    if @donation.status == 'succeeded' && @donation.event_id?
      @donation.event.current_amount += @donation.contribution
      @donation.event.save
    elsif @donation.status == 'succeeded' && @donation.vault_id?
      @donation.vault.current_amount_vault += @donation.contribution
      @donation.vault.save

    end


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

    end
  end

private

def donation_params
  params.require(:donation).permit(:contribution, :event_id, :vault_id)
end

end
