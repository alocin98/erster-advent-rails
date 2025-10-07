// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
    static values = {
        timeout: { type: Number, default: 5000 }, // default: 5s
    };

    connect() {
        setTimeout(() => this.dismiss(), this.timeoutValue);
    }

    dismiss() {
        // Add fade-out class
        this.element.classList.add("opacity-0", "transition", "duration-500");

        // Remove after animation
        setTimeout(() => this.element.remove(), 500);
    }
}
