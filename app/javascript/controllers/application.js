import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

document.addEventListener("turbo:load", () => {
    if (window.lucide) {
        lucide.createIcons()
    }
})

document.addEventListener("turbo:frame-load", () => {
    if (window.lucide) {
        lucide.createIcons()
    }
})
