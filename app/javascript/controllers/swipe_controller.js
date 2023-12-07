import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["showButton", "refuseButton", "likeButton", "foodmatch"]
  static values = {
    userLikedId: Number
  }
  connect() {
    this.token = document.querySelector('meta[name=csrf-token]').content
  }

  show() {
    window.location.href = '/users/' + this.userLikedIdValue;
  }

  swipe(e) {
    const touchendX = e.changedTouches[0].clientX;
    const diff = this.touchstartX - touchendX
    if (diff === 0) {
      this.show()
    }
    if (diff > 10) {
      this.element.remove()
    }
    else if (diff < -10) {
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
      .then((data) => { this.#isMatchExist(data, true) })
    }
  }

  getData(e) {
    this.touchstartX = e.changedTouches[0].clientX
  }


  animate(e) {
    this.likeButtonTarget.style = 'display: none;'
    this.refuseButtonTarget.style = 'display: none;'
    this.touchendX = e.changedTouches[0].clientX
    const deplacement = this.touchendX - this.touchstartX;
    this.element.style = `transform: translateX(${deplacement}px);`
  }

  like(_event) {
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

  #isMatchExist(data, deplacement=false) { // { item: Like, match: true | false | null, message: "Item created" }
    if (data.match) {
      if (deplacement) {
        const deplacement = this.touchstartX - this.touchstartX;
        this.element.style = `transform: translateX(${deplacement}px);`
      }
      fetch("/match?user_liked_id=" + this.userLikedIdValue + "&authorization_token=" + this.token, {
        method: "GET",
        headers: { "Accept": "text/plain" }
      })
        .then(response => response.text())
        .then((data) => {
          if (deplacement) {
            this.#displayPartial(data, "animate2")
          } else {
            this.#displayPartial(data)
          }
        })
    } else {
      this.element.remove();
    }
  }

  #displayPartial(data, className='animate') {
    this.foodmatchTarget.insertAdjacentHTML('beforeend', data)
    this.foodmatchTarget.style.height = '80vh'
    this.foodmatchTarget.classList.add(className)
  }

  refuse(_event) {
    this.element.remove()
  }
}
