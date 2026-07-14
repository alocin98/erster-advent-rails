import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll-nav"
//
// Switches the navbar between its expanded hero state ("large") and the
// minimized purple bar ("small"). Scrolling down, the switch happens the
// moment the bottom edge of the expanded logo touches the page content
// (marked with [data-nav-boundary]); scrolling up, the expanded navbar
// already returns once the bottom of the minimized bar clears the content.
export default class extends Controller {
    static DEFAULT_THRESHOLD = 10;

    connect() {
        this.lastScrollY = window.scrollY;
        this.ticking = false;
        this.thresholds = this.computeThresholds();
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

    computeThresholds() {
        const boundary = document.querySelector("[data-nav-boundary]");
        if (boundary) {
            // The marker's top edge is where the overlapping content starts;
            // data-nav-boundary="bottom" marks a hero band instead, whose
            // bottom edge is where the content starts.
            const rect = boundary.getBoundingClientRect();
            const edge = boundary.dataset.navBoundary === "bottom" ? rect.bottom : rect.top;
            const boundaryTop = edge + window.scrollY;
            const largeLogoBottom = this.measureCssHeight(
                "calc(var(--nav-top-offset, 0px) + var(--nav-logo-height, 0px))"
            );
            const smallBarBottom = this.measureCssHeight("var(--nav-small-height, 0px)");
            return {
                down: Math.max(boundaryTop - largeLogoBottom, 0),
                up: Math.max(boundaryTop - smallBarBottom, 0),
            };
        }

        const hero = document.querySelector("[data-hero]");
        const threshold = hero ? hero.offsetHeight : this.constructor.DEFAULT_THRESHOLD;
        return { down: threshold, up: threshold };
    }

    // Resolves a CSS height expression (media queries, clamp()) to actual
    // pixels by measuring a probe element.
    measureCssHeight(expression) {
        const probe = document.createElement("div");
        probe.style.cssText =
            "position:absolute;visibility:hidden;pointer-events:none;" +
            `height:${expression};`;
        document.body.appendChild(probe);
        const height = probe.offsetHeight;
        probe.remove();
        return height;
    }

    onResize() {
        this.thresholds = this.computeThresholds();
        this.toggleBackground();
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
        const goingDown = scrollY > this.lastScrollY;
        const threshold = goingDown ? this.thresholds.down : this.thresholds.up;

        if (scrollY > threshold) {
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
