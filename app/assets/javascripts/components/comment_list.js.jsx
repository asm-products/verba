var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function(comment) {
      return (
        <Comment username={comment.username} date={comment.date} content={comment.content}/>
      )
    })
    return (
      <div className="comment-box__comment-list">{ commentNodes }</div>
    )
  }
})
