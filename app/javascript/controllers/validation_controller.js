import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["field", "input", "button"]

    validate () {
        this[this.validator]()
    }

    enableButton () {
        const isFilled = (input) => (input.value > 0 || input.checked === true)
        if (this.inputTarget.type === "checkbox") {
            let enable = this.inputTargets.some(isFilled)
            this.buttonTarget.disabled = !enable
        } else {
            let enable = this.inputTargets.every(isFilled)
            this.buttonTarget.disabled = !enable
        }

    }

    row () {
        if (this.fieldTarget.value > 26) {
            this.fieldTarget.value = 26
        }
    }

    get validator () {
        return this.fieldTarget.dataset.validator
    }
}