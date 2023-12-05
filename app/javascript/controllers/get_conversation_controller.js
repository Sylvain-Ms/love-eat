import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="get-conversation"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    userLikedId: Number
  }

  connect() {
    this.token = document.querySelector('meta[name=csrf-token]').content
  }

  show() {
    fetch(`/exist?user_liked_id=${this.userLikedIdValue}&authorization-token=${this.token}`, {
      method: "GET",
      headers: {
        "content-type": "application/json"
      }
    })
    .then(response => response.json())
    .then((data) => { window.location.href += `/${data["id"]}` })
  }

  swipe(e) {
    e.preventDefault()
    const touchendX = e.changedTouches[0].clientX;
    const diff = this.touchstartX - touchendX
    if (diff > 0) {
      fetch(`/conversations/0?authenticity_token=${this.token}&user_liked_id=${this.userLikedIdValue}`, {
        method: "DELETE",
        headers: {
          "content-type": "application/json"
        }
      })
      .then(response => response.json())
      .then((data)=> this.element.remove())
    }
    else {
      this.show()
    }
  }

  getData(e) {
    this.touchstartX = e.changedTouches[0].clientX
  }

  animate(e) {
    const deplacement = e.changedTouches[0].clientX - this.touchstartX;
    if (deplacement < 0) {
      this.element.style = `transform: translateX(${deplacement}px); box-shadow: #C51414 ${-deplacement}px 0px`
    } else {
      this.element.style = `transform: translateX(${deplacement}px); box-shadow: #84A59D ${-deplacement}px 0px`
    }
  }
}
