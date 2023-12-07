import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-chat"
export default class extends Controller {
  connect() {
  }

  send(e) {
    e.preventDefault();
    this.element.submit();
  }
}
