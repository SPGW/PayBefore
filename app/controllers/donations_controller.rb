class DonationsController < ApplicationController
  def create
    if current_user
      @donation = Donation.new(donation_params)
      @donation.user = current_user

      # Validate the contribution amount
      amount = donation_params["contribution"].gsub(".", "").to_i
      if amount <= 0
        flash[:alert] = "Donation amount must be greater than zero."
        redirect_to event_path(@donation.event_id) and return
      end

      # Create the PaymentIntent if the amount is valid
      paymentIntent = Stripe::PaymentIntent.create({
        amount: amount,
        currency: 'eur',
        automatic_payment_methods: { enabled: true },
      })
      @donation.payment_intent_id = paymentIntent.client_secret

      if @donation.save
        redirect_to donation_checkout_path(@donation)
      else
        flash[:alert] = "There was an error processing your donation. Please try again."
        redirect_to event_path(@donation.event_id)
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
    if @donation.status == 'succeeded'
      @donation.is_complete = true
    end
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
