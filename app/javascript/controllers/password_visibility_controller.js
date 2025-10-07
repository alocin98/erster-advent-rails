import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "showIcon", "hideIcon", "label"]

  connect() {
    this.visible = false
  }

  toggle() {
    this.visible = !this.visible
    this.inputTarget.type = this.visible ? "text" : "password"
    this.showIconTarget.classList.toggle("hidden", this.visible)
    this.hideIconTarget.classList.toggle("hidden", !this.visible)

    if (this.hasLabelTarget) {
      this.labelTarget.textContent = this.visible ? "Passwort verbergen" : "Passwort anzeigen"
    }
  }
}
