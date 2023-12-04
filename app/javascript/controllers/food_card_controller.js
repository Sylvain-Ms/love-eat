import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="food-card"
export default class extends Controller {
  static targets = ["card"]

  connect() {
  }
  select(event) {
    this.cardTarget.classList.toggle('card_selected')
  }
}
