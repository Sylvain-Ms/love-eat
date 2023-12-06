import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="suggestions"
export default class extends Controller {
  static targets = ["btnAccept", "btnDecline", "message"]
  static values = {
    suggestionId: Number
  }
  connect() {
    this.token = document.querySelector('meta[name=csrf-token]').content
  }

  accept() {
    this.btnAcceptTarget.style = 'display: none;'
    this.btnDeclineTarget.style = 'display: none;'
    this.update('accepted', "Vous avez accepté l'invitation!")
  }

  refuse() {
    this.btnDeclineTarget.style = 'display: none;'
    this.btnAcceptTarget.style = 'display: none;'
    this.update('rejected', "Vous avez décliné l'invitation. Voulez vous proposer un autre restaurant?")

  }

  update(status, message) {
    fetch(`/restaurants/1/suggestions/${this.suggestionIdValue}`, {
      method: "PATCH",
      headers: {
        "content-type": "application/json",
        'Accept': 'application/json'
      },
      body: JSON.stringify({
        'status': status,
        "authenticity_token": this.token
      })
    })
    .then(response => response.json())
    .then((data) => this.messageTarget.insertAdjacentHTML('beforeend', message))
  }
}
