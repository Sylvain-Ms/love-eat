import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["refuseButton", "likeButton", "foodmatch"]
  static values = {
    userLikedId: Number
  }
  connect() {
    console.log(this.foodmatchTarget)
    this.token = document.querySelector('meta[name=csrf-token]').content
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
        'user_liked_id': this.userLikedIdValue,
        "authenticity_token": this.token
      }),
      headers: {
        "Content-type": "application/json"
      }
    })
      .then(response => response.json())
      .then((data) => { this.#isMatchExist(data) })
  }

  #isMatchExist(data) { // { item: Like, match: true | false | null, message: "Item created" }
    if (data.match) {
      fetch("/match?user_liked_id=" + this.userLikedIdValue + "&authorization_token=" + this.token, {
        method: "GET",
        headers: { "Accept": "text/plain" }
      })
        .then(response => response.text())
        .then((data) => {
          this.#displayPartial(data)
        })
    }
  }

  #displayPartial(data) {
    this.foodmatchTarget.insertAdjacentHTML('beforeend', data)
    this.foodmatchTarget.style.height = '80%'
    this.foodmatchTarget.classList.add('animate')
  }

  refuse(event) {
    console.log(event)
    this.element.remove()
  }
}
