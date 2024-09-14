import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['name']

  connect() {
    this.token = document.querySelector(
      'meta[name="csrf-token"]'
    ).content;
  }

  submit(e) {
    if(this.nameTarget.value) {
      e.preventDefault()
      fetch(e.srcElement.form.action, {
        method: 'PUT',
        headers: {
          'X-CSRF-Token': this.token,
          'Content-Type': 'application/json'
        },
        credentials: 'same-origin',
        body: JSON.stringify({
          name: this.nameTarget.value
        })
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    } else {
      e.preventDefault()
      let input = document.getElementById('name')
      input.scrollIntoView()
      input.focus()
    }
  }

  lockSquares(e) {
    e.preventDefault()
    fetch(e.srcElement.form.action, {
      method: 'POST',
      redirect: 'follow',
      headers: {
        'X-CSRF-Token': this.token,
        'Content-Type': 'application/json'
      },
      credentials: 'same-origin',
      body: JSON.stringify({
        name: this.nameTarget.value
      })
    }).then((response) => {
      console.log(response)
      document.getElementById('name_container').classList.add('hidden')
      response
    })
  }

  showLockButton() {
    document.getElementById("lock_button").classList.remove('hidden')
  }
}
