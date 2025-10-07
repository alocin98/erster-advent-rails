import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-nav"
export default class extends Controller {
    connect() {
        this.handleScroll = this.toggleBackground.bind(this);
        window.addEventListener("scroll", this.handleScroll);
    }

    disconnect() {
        window.removeEventListener("scroll", this.handleScroll);
    }

    toggleBackground() {
        if (window.scrollY > 10) {
            this.element.classList.remove("large");
            this.element.classList.add("small");
        } else {
            this.element.classList.add("large");
            this.element.classList.remove("small");
        }
    }
}
