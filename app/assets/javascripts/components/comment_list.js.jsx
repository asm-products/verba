var CommentList = React.createClass({
  getInitialState: function() {
    return { data: JSON.parse(this.props.data) }
  },
  render: function() {
    var commentNodes = this.state.data.map(function(comment) {
      return (
        <Comment username={comment.username} date={comment.date} content={comment.content}/>
      )
    })
    return (
      <div className="comment-box__comment-list">{ commentNodes }</div>
    )
  }
})
