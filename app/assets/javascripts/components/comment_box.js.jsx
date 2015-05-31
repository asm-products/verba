var CommentBox = React.createClass({
  getInitialState: function() {
    return { data: JSON.parse(this.props.data) }
  },
  handleCommentSubmit: function(comment) {
    var comments = this.state.data
    comments.unshift(comment)
    console.log(comments)
    this.setState({data: comments})
  },
  render: function() {
    return (
      <div>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
      </div>
    )
  }
})
