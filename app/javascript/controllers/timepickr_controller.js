import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"


// Connects to data-controller="timepickr"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
        noCalendar: true,
        enableTime: true,
        dateFormat: "H:i",
        minTime: "12h00",
        maxTime: "22:00",
        defaultDate: "20:00",
    })
  }
}
