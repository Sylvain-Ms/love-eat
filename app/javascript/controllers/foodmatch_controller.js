import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="foodmatch"
export default class extends Controller {
  static targets = ["conversationButton", "nextButton"]
  static values = {
    userLikedId: Number
  }
  connect() {
    console.log(this.userLikedIdValue)
    this.token = document.querySelector('meta[name=csrf-token]').content
  }

  conversation(event) {
    console.log(event)
    fetch(`/conversations`, {
      method: "POST",
      body: JSON.stringify({
        'user_liked_id': this.userLikedIdValue,
        "authenticity_token": this.token
      }),
      headers: {
        "Content-type": "application/json",
        "Accept": 'application/json'
      }
    })
      .then(response => response.json())
      .then((data) => { window.location.href="/conversations/" + data['id'] })
  }

  next(event) {
    console.dir(this.element)
    this.element.parentElement.remove()
  }
}
