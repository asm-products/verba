var UseRandomPromptLink = React.createClass({
  render: function() {
    return (
      <a href={this.props.path} data-method="post" className="start-writing">Use random prompt</a>
    )
  }
})
