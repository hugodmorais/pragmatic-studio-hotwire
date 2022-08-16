import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log("lolo")
    this.element.style.animation = "fade-in-and-out 4s"
    setTimeout(() => { this.element.remove() }, 4000)
  }
}
