import { Application } from "@hotwired/stimulus"
import ConfirmController from "./confirm_controller";

const application = Application.start()
application.register("confirm", ConfirmController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
