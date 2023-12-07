import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="send-card"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    conversationId: Number,
    restaurantId: Number
  }
  connect() {
    this.token = document.querySelector('meta[name=csrf-token]').content
    console.log(this.token)
  }

  #open(data) {
    fetch('/conversations/' + this.conversationIdValue + '/messages', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        'content': data,
        "authenticity_token": this.token
      })
    })
  }

  get() {
    fetch('/conversations/' + this.conversationIdValue + '/get_asking_card?restaurant_id=' + this.restaurantIdValue, {
      headers: {
        'Accept': 'text/plain',
      }
    })
    .then(response => response.text())
    .then(data => this.#open(data))
  }
}
