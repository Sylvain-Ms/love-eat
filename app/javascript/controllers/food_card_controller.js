import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="food-card"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    this.list = []
  }

  select(event) {
    event.currentTarget.classList.toggle('card_selected')
    // si l'id est deja dans la list
    if (this.list.includes(event.currentTarget.id)) {
      // trouver l'index de l'id
      const index = this.list.indexOf(event.currentTarget.id)
      // enlever l'id de la list
      this.list.splice(index, 1)
    }
    // sinon{}
    else {
      // le rajouter
      this.list.push(event.currentTarget.id)
    }
    console.log(this.list);
  }

  submit(e) {
    console.log(e)
  }

  prolonge(e) {
    e.currentTarget.previousElementSibling.click()
  }
}
