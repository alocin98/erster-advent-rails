import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "clear"]

  connect() {
    this.toggleClear()
  }

  toggleClear() {
    this.clearTarget.classList.toggle("hidden", this.inputTarget.value.length === 0)
  }

  clear() {
    this.inputTarget.value = ""
    this.inputTarget.focus()
    this.toggleClear()
  }
}
