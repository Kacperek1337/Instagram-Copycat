import React from "react"
import PropTypes from "prop-types"
import InfiniteScroll from 'react-infinite-scroller'
import axios from "axios"
import Post from "./Post"

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      hasMore: true
    }
  }

  handleResponse = response => {
    if (response.data.length != 0) {
      this.setState({
        posts: this.state.posts.concat(response.data)
      });
    } else {
      this.setState({
        hasMore: false
      });
    }
  }

  loadMorePosts = page => {
    axios.get(this.props.postsJsonUrl, {
      params: {
        "page": page
      },
      headers: {
        "X-CSRF-Token": this.props.csrfToken
      }
    }).then(this.handleResponse);
  }

  render () {
    let items = [];

    this.state.posts.map((post, i) => {
      items.push(
        <Post
        postTitle={post.title}
        postUrl={`/posts/${post.id}`}
        likeCount={post.like_count}
        commentCount={post.comment_count}
        imageUrl={post.picture.url}
        nickname={post.author}
        key={i}>
        </Post>
      );
    });

    return (
      <React.Fragment>
        <InfiniteScroll
        pageStart={0}
        loadMore={this.loadMorePosts}
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

Home.propTypes = {
  postsJsonUrl: PropTypes.string,
  csrfToken: PropTypes.string
}

export default Home
