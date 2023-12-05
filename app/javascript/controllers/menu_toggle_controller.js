import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-toggle"
export default class extends Controller {

static targets = ["menu", "button"]
  connect() {
  }

  open(e) {
    this.menuTarget.classList.toggle('animate_slice')
    this.buttonTarget.classList.toggle("backward")
  }
}
