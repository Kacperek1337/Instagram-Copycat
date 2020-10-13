import React from "react"
import PropTypes from "prop-types"
import Pluralize from "pluralize"

class Post extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="container text-center">
          <h2>{this.props.postTitle}</h2>
          <a href={this.props.postUrl}>
            <img src={this.props.imageUrl} width="60%" className="mb-2"></img>
          </a>
          <h5>By <a href={`/profile/${this.props.nickname}`}>{this.props.nickname}</a> | {Pluralize("Like", this.props.likeCount, true)} | {Pluralize("Comment", this.props.commentCount, true)}</h5>
        </div>
      </React.Fragment>
    );
  }
}

Post.propTypes = {
  postTitle: PropTypes.string,
  postUrl: PropTypes.string,
  likeCount: PropTypes.number,
  commentCount: PropTypes.number,
  imageUrl: PropTypes.string,
  nickname: PropTypes.string
};
export default Post
