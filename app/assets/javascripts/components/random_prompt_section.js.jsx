var RandomPromptSection = React.createClass({
  getInitialState: function() {
    return {
      path: this.props.path,
      prompt: this.props.prompt
    }
  },
  handleClick: function() {
    self = this
    $.ajax({
      url: "/refresh_random_prompt",
      success: function(data) {
        prompt = data["content"]
        id = data["id"]
        path = "/posts?prompt=" + id

        self.setState({prompt: prompt, path: path})
      }
    })
  },
  render: function() {
    return (
      <section className="select-prompt-section__random text-center">
        <h2>
          Random prompt
          <RefreshRandomPromptButton handleClick={this.handleClick} />
        </h2>
        <RandomPrompt prompt={this.state.prompt} />
        <UseRandomPromptLink path={this.state.path} />
      </section>
    )
  }
})
