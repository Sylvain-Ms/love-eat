import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="suggestions"
export default class extends Controller {
  static targets = ["btnAccept", "btnDecline", 'message']
  connect() {
    console.log(this.btnAcceptTarget)
  }

  accept() {
    this.btnAcceptTarget.style = 'display: none;'
    this.btnDeclineTarget.style = 'display: none;'
    this.messageTarget.insertAdjacentHTML('beforeend', "Vous avez accepté l'invitation !")
  }

  refuse() {
    this.btnDeclineTarget.style = 'display: none;'
    this.btnAcceptTarget.style = 'display: none;'
    this.messageTarget.insertAdjacentHTML('beforeend', "Vous avez décliné l'invitation. Voulez vous proposer un autre restaurant ? ")
  }
}
