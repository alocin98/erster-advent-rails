import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropdown"
//
// Simple click-toggled dropdown: the button toggles the menu, clicking
// anywhere outside (or pressing Escape) closes it. The "open" class on the
// root element drives the open styling via group-[.open]/dropdown variants.
export default class extends Controller {
    static targets = ["menu"];

    toggle() {
        this.element.classList.toggle("open");
        this.menuTarget.classList.toggle("hidden");
    }

    close() {
        this.element.classList.remove("open");
        this.menuTarget.classList.add("hidden");
    }

    closeOnOutsideClick(event) {
        if (this.element.contains(event.target)) return;
        this.close();
    }
}
