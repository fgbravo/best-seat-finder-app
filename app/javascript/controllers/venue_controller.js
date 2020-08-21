import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["rows", "columns", "list"]

    buildSeats () {
        this.listTarget.style.gridTemplateRows = `repeat(${this.rowsTarget.value}, 1fr`
        this.listTarget.style.gridTemplateColumns = `repeat(${this.columnsTarget.value}, 1fr`
        for (let i = 0; i < this.rowsTarget.value; i++) {
            let letter = this.alphabet()[i]
            for (let n = 0; n < this.columnsTarget.value; n++) {
                let id = `${letter}${n + 1}`
                let div = this.createDiv()
                let label = this.createLabel(id)
                let checkbox = this.createCheckbox(id)
                div.appendChild(label)
                div.appendChild(checkbox)
                this.listTarget.appendChild(div)
            }
        }
    }

    createDiv() {
        let div = document.createElement("div")
        div.classList.add("seat")
        return div
    }

    createLabel(id) {
        let label = document.createElement("label")
        label.innerText = id
        label.htmlFor = id
        return label
    }

    createCheckbox(id) {
        let checkbox = document.createElement("input")
        checkbox.id = id
        checkbox.classList.add("checkbox")
        checkbox.setAttribute("type", "checkbox")
        checkbox.setAttribute("name", `seats[${id}][id]`)
        checkbox.dataset.target = "validation.input"
        checkbox.dataset.action = "change->validation#enableButton"
        checkbox.value = id
        return checkbox
    }

    alphabet () {
        return "abcdefghijklmnopqrstuvwxyz"
    }
}