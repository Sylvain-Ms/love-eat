import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="get-conversation"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    userLikedId: Number
  }

  connect() {
    this.token = document.querySelector('meta[name=csrf-token]').content
    console.log(this.userLikedIdValue)
  }

  show() {
    fetch(`/exist?user_liked_id=${this.userLikedIdValue}&authorization-token=${this.token}`, {
      method: "GET",
      headers: {
        "content-type": "application/json"
      }
    })
    .then(response => response.json())
    .then((data) => { window.location.href = `conversations/${data["id"]}` })
  }
}
