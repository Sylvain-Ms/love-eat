import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="send-card"
export default class extends Controller {
  static targets = ["card"]
  connect() {
    console.log("Bonjour")
  }

  open() {
    fetch (`/restaurants`)
    method: "GET"

  }
}
