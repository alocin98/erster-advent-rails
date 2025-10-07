import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="multiselect"
export default class extends Controller {
    static targets = ["checkbox", "count", "tags"];

    update() {
        const selected = this.checkboxTargets.filter((cb) => cb.checked);
        this.countTarget.textContent = selected.length;
        this.tagsTarget.innerHTML = selected
            .map((cb) => `<span class="badge badge-outline">${cb.value}</span>`)
            .join("");
    }
}
