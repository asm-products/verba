var CommentForm = React.createClass({
  handleSubmit: function (e) {
    e.preventDefault()
    React.findDOMNode(this.refs.content).value = ""
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
