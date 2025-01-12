import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["element"];

  toggle() {
    this.elementTarget.classList.toggle("hidden");
    document.getElementById("chevron-down").classList.toggle("hidden");
    document.getElementById("chevron-up").classList.toggle("hidden");
  }
}
