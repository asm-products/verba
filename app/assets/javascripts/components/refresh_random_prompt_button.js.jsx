var RefreshRandomPromptButton = React.createClass({
  handleClick: function(event) {
    this.props.handleClick()
  },
  render: function() {
    return (
      <i onClick={this.handleClick} className="fa fa-refresh refresh-random-prompt"></i>
    )
  }
})
