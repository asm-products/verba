var CommentForm = React.createClass({
  handleSubmit: function (e) {
    e.preventDefault()
    var content = React.findDOMNode(this.refs.content)
    var date = new Date().toJSON().slice(0, 10)
    this.props.onCommentSubmit({username: "garrett", date: date, content: content.value})
    console.log(content)
    content.value = ""
  },
  render: function() {
    return (
      <div className="comment-box__input">
        <form className="flex-start--column" onSubmit={this.handleSubmit}>
          <textarea ref="content" placeholder="Leave your feedback here." />
          <input ref="post_id" type="hidden" value={this.props.post_id} />
          <input type="submit" value="Post comment" className="button" />
        </form>
      </div>
    )
  }
})
