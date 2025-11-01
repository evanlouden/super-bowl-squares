import { Application } from "@hotwired/stimulus"
import ConfirmController from "./confirm_controller";
import ToggleController from "./toggle_controller";

const application = Application.start()
application.register("confirm", ConfirmController);
application.register("toggle", ToggleController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
