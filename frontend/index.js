import React from 'react';
import ReactDOM from 'react-dom';

import {
  BrowserRouter as Router,
  Route,
  Link
} from 'react-router-dom';

class GraphQLExample extends React.Component {
  render() {
    return (
      <Router>
        <h1>Hello World!</h1>
      </Router>
    );
  }
}

ReactDOM.render(<GraphQLExample />, document.getElementById('app'));
