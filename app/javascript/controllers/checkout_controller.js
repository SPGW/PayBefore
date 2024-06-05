import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkout"
export default class extends Controller {
  static targets = ["payment", "submit", "error"]
  static values = {
    secret: String,
    key: String
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
    const elements = this.stripe.elements(options);

    // Create and mount the Payment Element
    const paymentElement = elements.create('payment');
    paymentElement.mount(this.paymentTarget);
  }
}
