import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "overlay"]

  connect() {
    console.log("connect")
  }

  open() {
    console.log("open")
    this.overlayTarget.classList.remove("hidden")
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    console.log("close")
    this.overlayTarget.classList.add("hidden")
    this.modalTarget.classList.add("hidden")
  }

  handleFormSubmission(event) {
    if (event.detail.success) {
      console.log("Form submitted successfully")
      this.close()
    } else {
      console.log("Form submission failed")
    }
  }
}