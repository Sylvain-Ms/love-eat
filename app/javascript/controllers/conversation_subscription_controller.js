import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="conversation-subscription"
export default class extends Controller {
  static values = { conversationId: Number, userId: Number, currentUserId: Number }
  static targets = ["messages", 'form', 'input']

  connect() {
    // console.log(console.log(`Subscribe to the conversation with the id ${this.conversationIdValue}.`));
    this.token = document.querySelector('meta[name=csrf-token]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  send(e) {
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: {
        "Content-type": 'application/json'
      },
      body: JSON.stringify({
        'authenticity_token': this.token,
        'content': this.inputTarget.value,
        'conversation_id': this.conversationIdValue
      })
    }).then(_response => this.formTarget.reset())
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    const parser = new DOMParser();
    const html = parser.parseFromString(data, 'text/html');
    if (this.currentUserIdValue !== parseInt(html.querySelector('div').dataset['conversationSubscriptionUserIdValue'])) {
      data = data.replaceAll('sender', 'receiver')
    }
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
