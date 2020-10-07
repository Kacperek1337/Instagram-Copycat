import React from "react"
import PropTypes from "prop-types"
import * as axios from "axios"

class LikeableImage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLiked: props.isLiked,
      likes: "loading likes...",
    };
    this.updateLikes();
  };

  updateLikes = () => {
    axios.get(window.location.href + ".json")
    .then(response => {
      this.setState({
        likes: (() => {
          const like_count = response.data.post.like_count;
          if  (like_count == 1)
            return `${like_count} like`;
          else
            return `${like_count} likes`;
        })()
      });
    });
  }

  handleResponse = () => {
    this.setState({
      isLiked: !this.state.isLiked
    });
    this.updateLikes();
  }

  handleDoubleClick = () => {
    axios({
      ...(this.state.isLiked ?
        {
          method: "DELETE",
          url: this.props.destroyLikeUrl
        } :
        {
          method: "POST",
          url: this.props.createLikeUrl
        }),
      headers: {
        "X-CSRF-Token": this.props.csrfToken
      }
    }).then(this.handleResponse);
  };

  render () {
    return (
      <>
        <img onDoubleClick={this.handleDoubleClick}
        src={this.props.imageUrl}
        style={this.props.style}/>
        <h5 class="mt-2">{this.state.likes}</h5>
        <h6 class="text-secondary">{this.state.isLiked ? "You like this post!" : null}</h6>
      </>
    );
  }
}

LikeableImage.propTypes = {
  imageUrl: PropTypes.string,
  createLikeUrl: PropTypes.string,
  destroyLikeUrl: PropTypes.string,
  isLiked: PropTypes.bool,
  csrfToken: PropTypes.string,
  style: PropTypes.object
};

export default LikeableImage
