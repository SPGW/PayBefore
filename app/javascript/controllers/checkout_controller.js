import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkout"
export default class extends Controller {
  static values = {
    secret: String,
    key: String
  }
  connect() {
    console.log(this.secretValue)
    console.log(this.keyValue)
  }
}
