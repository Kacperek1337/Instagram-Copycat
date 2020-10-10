import React from "react"
import PropTypes from "prop-types"
import InfiniteScroll from 'react-infinite-scroller';
import axios from "axios"

class Comments extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comments: [],
      hasMore: true
    };
  }

  handleResponse = response => {
    if (response.data.length != 0) {
      this.setState({
        comments: this.state.comments.concat(response.data)
      });
    } else {
      this.setState({
        hasMore: false
      });
    }
  }

  loadMoreComments = page => {
    axios.get(this.props.commentsJsonUrl, {
      params: {
        "page": page
      },
      headers: {
        "X-CSRF-Token": this.props.csrfToken
      }
    }).then(this.handleResponse);
  }

  deleteButton = id => {
    return (
      <button className="btn btn-sm btn-danger" onClick={() => {
        axios.delete(this.props.deleteCommentUrl, {
          params: {
            "id": id
          },
          headers: {
            "X-CSRF-Token": this.props.csrfToken
          }
        }).then(() => {
          this.setState({
            comments: this.state.comments.filter(comment => {
              return comment.id != id;
            })
          });
        });
      }}>Delete</button>
    )
  }

  render () {
    let items = [];

    this.state.comments.map((comment, i) => {
      items.push(
        <div className="mb-2" key={i}>
          <h3>{comment.content}</h3>
          <h6>By <a href={`/profile/${comment.author}`}>{comment.author}</a></h6>
          {comment.author == this.props.currentUserNickname  ? this.deleteButton(comment.id) : null}
        </div>
      );
    });
    return (
      <React.Fragment>
        <InfiniteScroll
        pageStart={0}
        loadMore={this.loadMoreComments}
        loader={
          <div className="loader" key={0}>Loading...</div>
        }
        hasMore={this.state.hasMore}>
          {items}
      </InfiniteScroll>
      </React.Fragment>
    );
  }
}

Comments.propTypes = {
  commentsJsonUrl: PropTypes.string,
  csrfToken: PropTypes.string,
  currentUserNickname: PropTypes.string,
  deleteCommentUrl: PropTypes.string
}

export default Comments
