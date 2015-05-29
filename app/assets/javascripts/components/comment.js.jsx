var Comment = React.createClass({
  render: function() {
    return (
      <div className="comment-box__comment">
        <span className="comment-box__comment--top-bar"></span>
        <h3 className="comment-box__comment--user">{ this.props.username }</h3>
        <p className="comment-box__comment--date">{ this.props.date }</p>
        <p className="comment-box__comment--content">{ this.props.content }</p>
      </div>
    )
  }
})
