import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-nav"
export default class extends Controller {
    static DEFAULT_THRESHOLD = 10;

    connect() {
        this.lastScrollY = window.scrollY;
        this.ticking = false;
        this.threshold = this.computeThreshold();
        this.handleScroll = this.onScroll.bind(this);
        this.handleResize = this.onResize.bind(this);
        window.addEventListener("scroll", this.handleScroll, { passive: true });
        window.addEventListener("resize", this.handleResize, { passive: true });
        this.toggleBackground();
    }

    disconnect() {
        window.removeEventListener("scroll", this.handleScroll);
        window.removeEventListener("resize", this.handleResize);
    }

    computeThreshold() {
        const hero = document.querySelector("[data-hero]");
        return hero ? hero.offsetHeight : this.constructor.DEFAULT_THRESHOLD;
    }

    onResize() {
        this.threshold = this.computeThreshold();
    }

    onScroll() {
        if (this.ticking) return;

        this.ticking = true;
        requestAnimationFrame(() => {
            this.toggleBackground();
            this.ticking = false;
        });
    }

    toggleBackground() {
        const scrollY = window.scrollY;

        if (scrollY > this.threshold) {
            this.element.classList.remove("large");
            this.element.classList.add("small");

            if (scrollY > this.lastScrollY) {
                this.element.classList.remove("up");
                this.element.classList.add("down");
            } else {
                this.element.classList.remove("down");
                this.element.classList.add("up");
            }
        } else {
            this.element.classList.add("large");
            this.element.classList.remove("small", "down", "up");
        }

        this.lastScrollY = scrollY;
    }
}
