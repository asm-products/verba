var CommentBox = React.createClass({
  getInitialState: function() {
    return { data: JSON.parse(this.props.data) }
  },
  render: function() {
    return (
      <div>
        <CommentList data={this.state.data} />
        <CommentForm />
      </div>
    )
  }
})
