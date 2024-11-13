import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "overlay"]

  connect() {
    console.log("connect")
  }

  open() {
    this.overlayTarget.classList.remove("hidden")
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    this.overlayTarget.classList.add("hidden")
    this.modalTarget.classList.add("hidden")
  }

  handleSuccess(event) {
    this.close()
  }
}