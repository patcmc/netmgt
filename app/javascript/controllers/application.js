import { Application } from "@hotwired/stimulus"
import ContactModalController from "./contacts/modal_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register("contactModal", ContactModalController)

export { application }
