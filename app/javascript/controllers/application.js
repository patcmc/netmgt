import { Application } from "@hotwired/stimulus"
import ContactModalController from "./contacts/contact_modal_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

application.register("contactModal", ContactModalController)

export { application }
