import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typed-text"
export default class extends Controller {
  connect() {
    console.log('connected', Typed)
    var options = {
      strings: [
        "", "Need Financial Assistance? Share your story and receive the support you need."
      ],
      typeSpeed: 30,
      backSpeed: 20,
      backDelay: 1000,
      startDelay: 500,
      loop: false,
      showCursor: true,
      cursorChar: ' '
    };

    var typed = new Typed('.element', options);
  }
}
