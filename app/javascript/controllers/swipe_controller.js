import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["refuseButton", "likeButton"]
  static values = /* https://stimulus.hotwired.dev/reference/values */
  connect() {
    console.log(this.refuseButtonTarget, this.likeButtonTarget)
  }

  swipe(event){
    console.log(event)
    /*  */
  }

  like(event) {
    console.log(event)
    /* notice: "You have liked this user 💛" */
    /* mettre le user_liked dans la DB */
    /* ne plus montrer le user_like dans User.all */
  }

  refuse(event){
    console.log(event)
    /* mettre le user_refused dans la DB */
    /* ne plus montrer le user_like dans User.all */
  }
}
