import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animate-progress"
export default class extends Controller {
  connect() {
    console.log("Connected", this.element);
    this.observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.style.setProperty("--animation", "load .5s forwards linear");
        } else {
          entry.target.style.setProperty("--animation", "none");
        }
      });
    });

    this.observer.observe(this.element);
  }

  disconnect() {
    this.observer.disconnect();
  }
}
