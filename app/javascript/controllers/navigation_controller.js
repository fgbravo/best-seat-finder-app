import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["next"]

    nextSection () {
        document.getElementById(this.nextTarget.dataset.currentSection).classList.add("hidden")
        document.getElementById(this.nextTarget.dataset.nextSection).classList.remove("hidden")
    }
}