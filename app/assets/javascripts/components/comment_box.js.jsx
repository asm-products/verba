var CommentBox = React.createClass({
  getInitialState: function() {
    return {
      data: JSON.parse(this.props.data),
      post_id: this.props.post_id}
  },
  handleCommentSubmit: function(comment) {
    var comments = this.state.data
    comments.unshift(comment)
    this.setState({data: comments})

    $.ajax({
      url: "/comments",
      type: "POST",
      data: {
        comment: comment
      },
      success: function(data) {
        alert("SUCCESS MOTHERFUCKER")
      }
    })
  },
  render: function() {
    return (
      <div>
        <CommentList data={this.state.data} />
        <CommentForm post_id={this.state.post_id} onCommentSubmit={this.handleCommentSubmit}/>
      </div>
    )
  }
})
