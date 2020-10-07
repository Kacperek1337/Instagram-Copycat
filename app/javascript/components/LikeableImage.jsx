import React from "react"
import PropTypes from "prop-types"

class LikeableImage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLiked: props.isLiked
    }
  };

  handleDoubleClick = () => {
    let xhr = new XMLHttpRequest()
    xhr.addEventListener("load", () => {
      if (xhr.status == 204)
        this.setState({
          isLiked: !this.state.isLiked
        })
    })
    if (this.state.isLiked)
      xhr.open("DELETE", this.props.destroyLikeUrl);
    else
      xhr.open("POST", this.props.createLikeUrl);
    xhr.setRequestHeader("X-CSRF-Token", this.props.csrfToken);
    xhr.send();
    this.forceUpdate();
  };

  render () {
    return (
      <>
        <img onDoubleClick={this.handleDoubleClick}
        src={this.props.imageUrl}
        style={this.props.style}/>
        <h6 class="text-secondary mt-2">{this.state.isLiked ? "You liked this post" : null}</h6>
      </>
    );
  }
}

LikeableImage.propTypes = {
  imageUrl: PropTypes.string,
  createLikeUrl: PropTypes.string,
  destroyLikeUrl: PropTypes.string,
  isLiked: PropTypes.bool,
  crsfToken: PropTypes.string,
  style: PropTypes.object
};

export default LikeableImage
