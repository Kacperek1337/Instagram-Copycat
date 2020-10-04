import React from "react"
import PropTypes from "prop-types"
class Notice extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="container mt-3">
          <div className={`alert alert-${this.props.type} alert-dismissible fade show`}>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            {this.props.notice}
          </div>
        </div>
      </React.Fragment>
    );
  }
}

Notice.propTypes = {
  notice: PropTypes.string,
  type: PropTypes.string
};

Notice.defaultProps = {
  type: "primary"
}

export default Notice
