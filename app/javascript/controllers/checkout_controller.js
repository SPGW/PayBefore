import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkout"
export default class extends Controller {
  static targets = ["payment", "submit", "error"]
  static values = {
    secret: String,
    key: String,
    id: String
  }
  connect() {
    console.log(this.secretValue)
    console.log(this.keyValue)
    this.stripe = Stripe(this.keyValue);
    const options = {
      clientSecret: this.secretValue,
      // Fully customizable with appearance API.
      // appearance: {/*...*/},
    };
    this.elements = this.stripe.elements(options);

    // Create and mount the Payment Element
    const paymentElement = this.elements.create('payment');
    paymentElement.mount(this.paymentTarget);
  }
  async submit(event){

      event.preventDefault();

      const {error} = await this.stripe.confirmPayment({
        //`Elements` instance that was used to create the Payment Element
        elements: this.elements,
        confirmParams: {
          return_url: `http://localhost:3000/donations/success/${this.idValue}`,
        },
      });

      if (error) {
        // This point will only be reached if there is an immediate error when
        // confirming the payment. Show error to your customer (for example, payment
        // details incomplete)
        // const messageContainer = document.querySelector('#error-message');
        this.errorTarget.textContent = error.message;
      } else {
        // Your customer will be redirected to your `return_url`. For some payment
        // methods like iDEAL, your customer will be redirected to an intermediate
        // site first to authorize the payment, then redirected to the `return_url`.
      }
  }
}
