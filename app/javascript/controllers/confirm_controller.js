import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  confirm(event) {
    if (!confirm(event.params.message)) {
      event.preventDefault();
    }
  }
}

// data: { controller: "confirm", action: "click->confirm#confirm", confirm_message_param: "Create a new game?" }
