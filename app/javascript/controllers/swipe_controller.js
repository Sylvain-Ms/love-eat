import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["refuseButton", "likeButton"]
  static values = {
    userLikedId: Number
  }
  connect() {
    console.log(this.userLikedIdValue)
  }

  swipe(event) {
    console.log(event)
    /*  */
  }

  like(event) {
    console.log(event)
    fetch(`/likes`, {
      method: "POST",
      body: JSON.stringify({
        'user_liked_id': this.userLikedIdValue
      }),
      headers: {
        "Content-type": "application/json"
      }
    })
      .then(response => response.json())
      .then((data) => { console.log(data) })
  }

  refuse(event) {
    console.log(event)
    this.element.remove()
  }
}