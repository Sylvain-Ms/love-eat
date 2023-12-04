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
    /* notice: "You have liked this user 💛" */
    /* mettre le user_liked dans la DB */
      /* fetch(``)
        .then(response => response.json())
        .then((data) => {
      console.log(data) */
    /* ne plus montrer le user_like dans User.all ? */
          /* this.element.remove() */
  }

  refuse(event) {
    console.log(event)
    this.element.remove()
  }
}
