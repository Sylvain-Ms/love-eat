import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="food-card"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    this.list = []
    this.token = document.querySelector('meta[name=csrf-token]').content
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
  }

  submit(e) {
      fetch('/foodmoods/restaurants', {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          'restaurant_ids': this.list,
          'foodmood': { 'name': "japanese" },
          'authenticity_token': this.token
        })
       })
        .then(response => response.json())
        .then((data) => console.log(data))
}

prolonge(e) {
  e.currentTarget.previousElementSibling.click()
}


}
