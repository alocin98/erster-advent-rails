import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="gallery-slider"
//
// Moves the store detail gallery horizontally in response to vertical page
// scrolling: down moves the strip left, up moves it back right.
export default class extends Controller {
    static targets = ["track"];
    static SCROLL_FACTOR = 0.8;

    connect() {
        this.offset = 0;
        this.lastScrollY = window.scrollY;
        this.ticking = false;
        this.measurementFrame = null;
        this.maxOffset = 0;
        this.handleScroll = this.onScroll.bind(this);
        this.handleMeasure = this.queueMeasure.bind(this);

        window.addEventListener("scroll", this.handleScroll, { passive: true });
        window.addEventListener("resize", this.handleMeasure, { passive: true });

        this.resizeObserver = new ResizeObserver(this.handleMeasure);
        this.resizeObserver.observe(this.element);
        this.resizeObserver.observe(this.trackTarget);

        this.imageLoadCleanups = Array.from(this.trackTarget.querySelectorAll("img")).map((image) => {
            if (image.complete) return null;

            image.addEventListener("load", this.handleMeasure, { once: true });
            return () => image.removeEventListener("load", this.handleMeasure);
        }).filter(Boolean);

        this.queueMeasure();
    }

    disconnect() {
        window.removeEventListener("scroll", this.handleScroll);
        window.removeEventListener("resize", this.handleMeasure);
        this.resizeObserver?.disconnect();
        this.imageLoadCleanups?.forEach((cleanup) => cleanup());

        if (this.measurementFrame) {
            cancelAnimationFrame(this.measurementFrame);
        }
    }

    queueMeasure() {
        if (this.measurementFrame) return;

        this.measurementFrame = requestAnimationFrame(() => {
            this.measurementFrame = null;
            this.measure();
        });
    }

    measure() {
        this.maxOffset = this.computeMaxOffset();
        this.offset = Math.min(this.offset, this.maxOffset);
        this.applyTransform();
    }

    onScroll() {
        if (this.ticking) return;

        this.ticking = true;
        requestAnimationFrame(() => {
            this.updateOffset();
            this.ticking = false;
        });
    }

    updateOffset() {
        const scrollY = window.scrollY;
        const delta = scrollY - this.lastScrollY;
        this.lastScrollY = scrollY;

        if (!this.isInMotionRange() || delta === 0) return;

        this.maxOffset = this.computeMaxOffset();

        this.offset = this.clamp(
            this.offset + delta * this.constructor.SCROLL_FACTOR,
            0,
            this.maxOffset
        );
        this.applyTransform();
    }

    applyTransform() {
        this.trackTarget.style.transform = `translate3d(${-this.offset}px, 0, 0)`;
    }

    computeMaxOffset() {
        const trackWidth = this.trackTarget.getBoundingClientRect().width;
        return Math.max(trackWidth - this.element.clientWidth, 0);
    }

    isInMotionRange() {
        const rect = this.element.getBoundingClientRect();
        return rect.bottom > 0 && rect.top < window.innerHeight;
    }

    clamp(value, min, max) {
        return Math.min(Math.max(value, min), max);
    }
}
