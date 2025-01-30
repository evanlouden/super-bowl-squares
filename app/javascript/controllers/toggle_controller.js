import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["element"];

  toggleHidden() {
    this.elementTarget.classList.toggle("hidden");
    this._toggleChevron();
  }

  toggleVisible() {
    this.elementTarget.classList.toggle("invisible");
    this._toggleChevron();
  }

  _toggleChevron() {
    document.getElementById("chevron-down").classList.toggle("hidden");
    document.getElementById("chevron-up").classList.toggle("hidden");
  }
}
