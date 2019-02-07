import React, { Component } from 'react';
import { connect } from 'react-redux';
import * as actions from './actions/index';
import _ from 'lodash';
import PropTypes from 'prop-types';
import 'bootstrap/dist/css/bootstrap.min.css';

export class App extends Component {

  componentWillMount() {
    this.props.getAllContents();
  }

  renderRows(items){
    return _.map(items, (val, key) => {
      return (
        <tr key={key}>
          <td>{val.title}</td>
          <td>{val.published_date}</td>
          <td>{val.author}</td>
          <td>{val.summary}</td>
          <td>{val.content}</td>
        </tr>
      );
    });
  }

  render() {
    const {items} = this.props.content;
    return (
      <div className="container">
        <h2>All Contents</h2>
        <table className="table">
          <thead>
            <tr>
              <th>​Title</th>
              <th>PublishedDate</th>
              <th>Author</th>
              <th>Summary</th>
              <th>Content​</th>
            </tr>
          </thead>
          <tbody>
            {this.renderRows(items)}
          </tbody>
        </table>
      </div>
    )

  }
}

App.propTypes = {
  getAllContents: PropTypes.func.isRequired,
  content: PropTypes.shape({
    items: PropTypes.arrayOf(
      PropTypes.shape({
        title: PropTypes.string,
        published_date: PropTypes.string,
        author: PropTypes.string,
        summary: PropTypes.string,
        content: PropTypes.string,
      })
    ),
  }).isRequired,
};

function mapStateToProps(state) {
  return { content : state.content };
}
export default connect(mapStateToProps, actions)(App);